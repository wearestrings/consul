require_dependency "consul_assemblies/application_controller"

module ConsulAssemblies
  class AssembliesController < ApplicationController
    include FeatureFlags
    include FlagActions


    before_action :authenticate_user!, except: [:index, :show, :map, :summary]
    before_action :load_assembly, only: :show
    before_action :load_active_assemblies, only: [:show, :index]
    before_action :load_meetings, only: [:index, :show]

    feature_flag :assemblies

    has_filters %w{open next past}, only: [:index, :show]


    skip_authorization_check
    helper_method :resource_model, :resource_name
    respond_to :html, :js

    def show
      render action: 'index'
    end

    def index

    end

    private

    def load_active_assemblies
      @assemblies = ConsulAssemblies::Assembly.all
    end

    def load_assembly
      @assembly = ConsulAssemblies::Assembly.find(params[:id])
    end

    def load_meetings
      @meetings = ConsulAssemblies::Meeting.order(scheduled_at: 'desc')
      @meetings = @meetings.where(assembly: @assembly) if @assembly
    end
  end
end
