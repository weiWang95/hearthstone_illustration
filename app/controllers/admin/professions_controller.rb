class Admin::ProfessionsController < Admin::BaseController
  before_action :load_crumb
  before_action :load_profession, only: [:edit, :update]

  def index
    @professions = Profession.all.page(params[:page])
  end

  def new
    add_crumb '新增职业'
    @form = ProfessionForm.new(Profession.new)
  end

  def create
    @form = ProfessionForm.new(Profession.new, permit_params)
    if @form.save
      redirect_to admin_professions_path
    else
      render 'new'
    end
  end

  def edit
    add_crumb '编辑职业'
    @form = ProfessionForm.new(@profession)
  end

  def update
    @form = ProfessionForm.new(Profession.new, permit_params)
    if @form.save
      redirect_to admin_professions_path
    else
      render 'edit'
    end
  end

  private

  def permit_params
    params.require(:profession_form).permit(:name, :icon, :skill)
  end

  def load_profession
    @profession = Profession.find(params[:id])
  end

  def load_crumb
    add_crumb('职业管理', admin_professions_path)
  end
end
