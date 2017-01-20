class Backoffice::AdminsController < BackofficeController
  before_action :get_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
  	# @admins = Admin.all
    @admins = policy_scope(Admin) # Will return Admin.all or Admin.with_restricted.access
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Admin created!"
    else 
      render :new
    end

  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Admin updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Admin deleted (#{admin_email})!"
    else
      render :index
    end

  end

  private

  def get_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    if password_blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    if @admin.blank?
      params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
    else
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end
  end

  def password_blank?
    params[:admin][:password].blank? &&
    params[:admin][:password_confirmation].blank?
  end
end