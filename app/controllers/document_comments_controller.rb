class DocumentCommentsController < ApplicationController
  before_action :set_document_comment, only: [:show, :edit, :update, :destroy]

  # GET /document_comments
  # GET /document_comments.json
  def index
    @document_comments = DocumentComment.all
  end

  # GET /document_comments/1
  # GET /document_comments/1.json
  def show
  end

  # GET /document_comments/new
  def new
    @document_comment = DocumentComment.new
  end

  # GET /document_comments/1/edit
  def edit
  end

  # POST /document_comments
  # POST /document_comments.json
  def create
    @document_comment = DocumentComment.new(document_comment_params)

    respond_to do |format|
      if @document_comment.save
        format.html { redirect_to @document_comment, notice: 'Document comment was successfully created.' }
        format.json { render :show, status: :created, location: @document_comment }
      else
        format.html { render :new }
        format.json { render json: @document_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_comments/1
  # PATCH/PUT /document_comments/1.json
  def update
    respond_to do |format|
      if @document_comment.update(document_comment_params)
        format.html { redirect_to @document_comment, notice: 'Document comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_comment }
      else
        format.html { render :edit }
        format.json { render json: @document_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_comments/1
  # DELETE /document_comments/1.json
  def destroy
    @document_comment.destroy
    respond_to do |format|
      format.html { redirect_to document_comments_url, notice: 'Document comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_comment
      @document_comment = DocumentComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_comment_params
      params.require(:document_comment).permit(:comment, :task_id, :rating)
    end
end
