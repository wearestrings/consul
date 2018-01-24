require_dependency "consul_assemblies/application_controller"

module ConsulAssemblies
  class MeetingsController < ApplicationController

    skip_authorization_check

    def show
      @meeting = ConsulAssemblies::Meeting.find(params[:id])
    end
  end
end
