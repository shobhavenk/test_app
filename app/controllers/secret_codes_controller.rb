class SecretCodesController < ApplicationController
    load_and_authorize_resource
  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @secret_codes }
    end
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
    @secret_code = SecretCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @secret_code }
    end
  end

  # GET /secret_codes/new
  # GET /secret_codes/new.json
  def new
    @secret_code = SecretCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @secret_code }
    end
  end

  # GET /secret_codes/1/edit
  def edit
    @secret_code = SecretCode.find(params[:id])
  end

  # POST /secret_codes
  # POST /secret_codes.json
  def create
    @secret_code = SecretCode.new(params[:secret_code])

    respond_to do |format|
      if @secret_code.save
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully created.' }
        format.json { render json: @secret_code, status: :created, location: @secret_code }
      else
        format.html { render action: "new" }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /secret_codes/1
  # PUT /secret_codes/1.json
  def update
    @secret_code = SecretCode.find(params[:id])

    respond_to do |format|
      if @secret_code.update_attributes(params[:secret_code])
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    @secret_code = SecretCode.find(params[:id])
    @secret_code.destroy

    respond_to do |format|
      format.html { redirect_to secret_codes_url }
      format.json { head :no_content }
    end
  end

  def generate_code
    @codes = []
   code_times = params[:times].to_i
   if code_times == 1
     @codes << SecretCode.create(:code => SecureRandom.hex(3))
   else
   code_times.to_i.times do |i| 
      @codes << SecretCode.create(:code => SecureRandom.hex(3))
   end
 end
   # SecretCode.import codes
  end
end
