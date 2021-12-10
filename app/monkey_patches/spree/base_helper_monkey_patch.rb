module Spree
  module BaseHelper
    def link_to_cart(text = nil)
      text = text ? h(text) : t('spree.cart')
      css_class = nil

      if current_order.nil? || current_order.item_count.zero?
        text = ""
        css_class = 'empty'
      else
        text = "<div class='link-text'>#{current_order.item_count}</div>"\
              #"<span class='amount'>#{current_order.display_total.to_html}</span>"
        css_class = 'full'
      end
      link_to text.html_safe, spree.cart_path, class: "cart-info #{css_class}"
    end
  end
end
