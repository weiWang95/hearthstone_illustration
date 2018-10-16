class Admin::ProfessionsController < Admin::BaseController
  before_action :load_crumb
  before_action :load_profession, only: [:edit, :update]

  def index
    professions  = Profession.all
    @count       = professions.count
    @professions = professions.page(params[:page])
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
  rescue ProfessionForm::Error => e
    render_unprocessable_entity(e.message)
  end

  def edit
    add_crumb '编辑职业'
    @form = ProfessionForm.new(@profession)
  end

  def update
    @form = ProfessionForm.new(@profession, permit_params)
    if @form.save
      redirect_to admin_professions_path
    else
      render 'edit'
    end
  rescue ProfessionForm::Error => e
    render_unprocessable_entity(e.message)
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
