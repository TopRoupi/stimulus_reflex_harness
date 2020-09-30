class SubmissionTestsController < ApplicationController
  before_action :set_submission_test, only: [:show, :edit, :update, :destroy]

  # GET /submission_tests
  def index
    @submission_tests = SubmissionTest.all
  end

  # GET /submission_tests/1
  def show
  end

  # GET /submission_tests/new
  def new
    @submission_test = SubmissionTest.new
  end

  # GET /submission_tests/1/edit
  def edit
  end

  # POST /submission_tests
  def create
    @submission_test = SubmissionTest.new(submission_test_params)

    if @submission_test.save
      redirect_to @submission_test, notice: 'Submission test was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /submission_tests/1
  def update
    if @submission_test.update(submission_test_params)
      redirect_to @submission_test, notice: 'Submission test was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /submission_tests/1
  def destroy
    @submission_test.destroy
    redirect_to submission_tests_url, notice: 'Submission test was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission_test
      @submission_test = SubmissionTest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def submission_test_params
      params.require(:submission_test).permit(:submission_id, :test_id)
    end
end
