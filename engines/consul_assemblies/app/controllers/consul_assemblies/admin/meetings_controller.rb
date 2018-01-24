require_dependency "consul_assemblies/application_controller"

module ConsulAssemblies
  class Admin::MeetingsController < Admin::AdminController

    #load_and_authorize_resource :page, class: "ConsulAssemblies::Meeting"

    before_action :load_meetings, only: [:index]
    before_action :load_assemblies, only: [:create, :new, :edit]


    def new
      @meeting = ConsulAssemblies::Meeting.new()
    end

    def edit
      @meeting = ConsulAssemblies::Meeting.find(params[:id])
    end

    def create
      @meeting = ConsulAssemblies::Meeting.new(meeting_params)
      if @meeting.save
        redirect_to admin_meetings_path, notice: t('admin.site_customization.pages.create.notice')
      else
        flash.now[:error] = t('admin.site_customization.pages.create.error')
        render :new
      end
    end

    def destroy
      @meeting = ConsulAssemblies::Meeting.find(params[:id])
      @meeting.destroy

      redirect_to :index
    end

    def update
      @meeting = ConsulAssemblies::Meeting.find(params[:id])
      if @meeting.update(meeting_params)
        redirect_to admin_meetings_path, notice: t('admin.site_customization.pages.create.notice')
      else
        flash.now[:error] = t('admin.site_customization.pages.create.error')
        render :new
      end
    end


    def index; end

    private

    def load_meetings
      @meetings = ConsulAssemblies::Meeting.order(scheduled_at: 'desc').page(params[:page] || 1)
    end

    def load_assemblies
      @assemblies = ConsulAssemblies::Assembly.order(:name)
    end

    def meeting_params
      params.require(:meeting).permit(
        :title,
        :summary,
        :description,
        :assembly_id,
        :status,
        :scheduled_at,
        :close_accepting_proposals_at,
        :about_venue,
        attachments_attributes: [:file, :title,:featured_image_flag, :_destroy, :id]
      )
    end
  end
end
