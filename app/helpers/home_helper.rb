module HomeHelper
    def period_to_s(months)
        ys = months / 12
        ms = months % 12
        I18n.t('years_and_months', years: ys, months: ms)
    end
end
