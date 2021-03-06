include Pagy::Backend
include Pagy::Frontend

module ApplicationHelper
   def plural(count, value, with_count = true)
     val = "plural.#{value}"
     result = Russian::p(count, t("#{val}_1"), t("#{val}_2"), t("#{val}_10"))
     if with_count
       [count.to_s, result].join(' ')
     else
       result
     end
   end

   def rus_datetime(datetime)
     Russian.strftime(datetime, '%d %b %Y / %H:%M')
   end

   def rus_date(datetime)
     Russian.strftime(datetime, '%d %b %Y')
   end
end
