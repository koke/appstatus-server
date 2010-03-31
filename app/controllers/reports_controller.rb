class ReportsController < ApplicationController
  # {"app_version":"1.1","app_id":1,"device_id":"124356"}
  def create
    report_params = {}
    # TODO: app_id is bundle_id
    app = App.find_by_bundle_id(params[:app_id])
    unless app
      render :text => '<rsp stat="fail"><err code="2" msg="Unknown app id"/></rsp>'
      return
    end
    report_params[:app_id] = app.id
    [:app_version, :device_id, :cause, :details, :email].each do |p|
      report_params[p] = params[p]
    end
    report_params[:remote_addr] = request.remote_addr
    @report = Report.new(report_params)
    if @report and @report.save
      render :text => "<rsp stat='ok'></rsp>"          
    else
      render :text => '<rsp stat="fail"><err code="1" msg="Unknown error"/></rsp>'
    end
  end
end
