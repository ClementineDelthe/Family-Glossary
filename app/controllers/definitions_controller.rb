class DefinitionsController < ApplicationController
  before_action :set_definition, only: %i[show edit update destroy like unlike]

  def index
    @definitions = Definition.all.reverse_order
    # action definitions#new
    @definition = Definition.new
    @top_definitions = Definition.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(3)

  end

  def show
    @comments = @definition.comments
    # @likes = @definition.likes
  end

  def new
    @definition = Definition.new
  end

  def create
    @definition = Definition.new(definition_params)
    @definition.user_id = current_user.id
    @definition.save
    redirect_to definition_path(@definition)
  end

  def edit
  end

  def update
    @definition.update(definition_params)
    redirect_to definition_path(@definition)
  end

  def destroy
    @definition.destroy
    redirect_to root_path, status: :see_other
  end

  def set_definition
    @definition = Definition.find(params[:id])
  end

  def mes_definitions
    @definitions = Definition.where(user_id: current_user.id).reverse_order
  end

  def week
    @definitions = Definition.where(created_at: (Time.now - 1.day)..Time.now).reverse_order
  end

  def top
    @top_definitions = Definition.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
  end

  def like
    @like = @definition.likes.build(user_id: current_user.id)
    # current_user.likes.create(likeable: @definition)
    render partial: "definitions/definition", local: { definition: @definition}
  end

  # def unlike
  #   current_user.likes.find_by(likeable: @definition).destroy
  #   redirect_to definition_path(@definition)
  # end

  private
  def definition_params
    params.require(:definition).permit(:title, :content)
  end
end
