class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    get_week
    @plan = Plan.new
  end

  # 予定の保存
  def create
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan)
  end
  # requireで指定するものは何の名前だったか
  # それが存在しているのかを確認する

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)
    

    7.times do |x|
      today_plans = []
      weeks_wday = wdays[Date.today.wday - 7 + x]
      plan = plans.map do |plan|
        today_plans.push(plan.plan) 
        if plan.date == @todays_date + x
        end
      end

      
<<<<<<< HEAD
      days = {month: (@todays_date + x).month, date: (@todays_date+x).day, plans: today_plans, wday: weeks_wday }
=======
      days = { :month => (@todays_date + x).month, :date => (@todays_date+x).day, :plans => today_plans, :wday => wdays[Date.today.wday - 7 + x]}

<<<<<<< Updated upstream
=======
>>>>>>> 7e64b7d1187dad7aeac6fd2cb06fd1d0376d69d8
>>>>>>> Stashed changes
      @week_days.push(days)
    end

  end
end
