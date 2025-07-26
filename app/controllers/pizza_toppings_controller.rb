class PizzaToppingsController < ApplicationController
  before_action :set_pizza_topping, only: %i[ show edit update destroy ]

  # GET /pizza_toppings or /pizza_toppings.json
  def index
    @pizza_toppings = PizzaTopping.all
  end

  # GET /pizza_toppings/1 or /pizza_toppings/1.json
  def show
  end

  # GET /pizza_toppings/new
  def new
    @pizza_topping = PizzaTopping.new
  end

  # GET /pizza_toppings/1/edit
  def edit
  end

  # POST /pizza_toppings or /pizza_toppings.json
  def create
    @pizza_topping = PizzaTopping.new(pizza_topping_params)

    respond_to do |format|
      if @pizza_topping.save
        format.html { redirect_to @pizza_topping, notice: "Pizza topping was successfully created." }
        format.json { render :show, status: :created, location: @pizza_topping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizza_topping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_toppings/1 or /pizza_toppings/1.json
  def update
    respond_to do |format|
      if @pizza_topping.update(pizza_topping_params)
        format.html { redirect_to @pizza_topping, notice: "Pizza topping was successfully updated." }
        format.json { render :show, status: :ok, location: @pizza_topping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizza_topping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizza_toppings/1 or /pizza_toppings/1.json
  def destroy
    @pizza_topping.destroy!

    respond_to do |format|
      format.html { redirect_to pizza_toppings_path, status: :see_other, notice: "Pizza topping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_topping
      @pizza_topping = PizzaTopping.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pizza_topping_params
      params.expect(pizza_topping: [ :pizza_id, :topping_id ])
    end
end
