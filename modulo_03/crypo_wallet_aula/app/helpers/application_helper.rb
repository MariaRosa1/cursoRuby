module ApplicationHelper
    def locale
        I18n.locale == :en ? "Inglês" : "Portugues"
    end

    def format_date(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else
            "teste"
        end
    end

end
