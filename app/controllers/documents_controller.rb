class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @document = Document.new
    @document.file.attach(params[:document][:file])
    @document.image.attach(params[:document][:image]) if params[:document][:image]

    if @document.save
      redirect_to @document, notice: "Fichier .dump importé avec succès"
    else
      flash[:alert] = @document.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show
    return render plain: "Paramètre UUID invalide", status: :bad_request if params[:id].blank?

    @document = Document.find_by(uuid: params[:id])

    if @document.nil?
      render plain: "Document non trouvé", status: :not_found
    elsif @document.file.attached?
      @download_link = url_for(@document.file)
    else
      render plain: "Fichier non trouvé", status: :not_found
    end
  end

  private

  def document_params
    params.require(:document).permit(:file, :image)
  end
end
