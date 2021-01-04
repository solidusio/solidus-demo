if blocklisted_ips = ENV['BLOCKLISTED_IPS']
  blocklisted_ips.split(',').each do |ip_address|
    Rack::Attack.blocklist_ip(ip_address)
  end
end

# Block suspicious requests for '/etc/password' or wordpress specific paths.
# Also blocks any parameters with suspicious contents.
# After 3 blocked requests in 10 minutes, block all requests from that IP for 7 days.
Rack::Attack.blocklist('fail2ban pentesters') do |req|
  # `filter` returns truthy value if request fails, or if it's from a previously banned IP
  # so the request is blocked
  Rack::Attack::Fail2Ban.filter("pentesters-#{req.ip}", maxretry: 3, findtime: 10.minutes, bantime: 7.days) do
    # The count for the IP is incremented if the return value is truthy
    CGI.unescape(req.query_string) =~ %r{/etc/passwd} ||
    req.path.include?('/etc/passwd') ||
    req.path.include?('wp-admin') ||
    req.path.include?('wp-login') ||
    req.params.to_s.include?('PG_SLEEP') ||
    req.params.to_s.include?('(sleep') ||
    req.params.to_s.include?('sleep(') ||
    req.params.to_s.include?('sysdate')
  end
end
