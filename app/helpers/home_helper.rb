module HomeHelper
    def period_to_s(months)
        ys = months / 12
        ms = months % 12
        if(ys == 0)
            if ms > 1
                I18n.t('months', months: ms)
            else
                I18n.t('month')
            end
        else
            if ms == 0
                if ys > 1
                    I18n.t('years', years: ys)
                else
                    I18n.t('year')
                end
            elsif ms == 1
                if ys > 1
                    I18n.t('years_and_month', years: ys)
                else
                    I18n.t('year_and_month')
                end
            else
                if ys > 1
                    I18n.t('years_and_months', years: ys, months: ms)
                else
                    I18n.t('year_and_months', months: ms)
                end
            end
        end
    end
end
