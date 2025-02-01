class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @document = Document.new
    @document.file.attach(params[:document][:file]) # Associer le fichier au document

    if @document.save
      redirect_to @document # Redirige vers l'URL unique
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @document = Document.find_by(uuid: params[:id])

    if @document.nil?
      render plain: "Document not found", status: :not_found
    elsif @document.file.attached?
      @download_link = url_for(@document.file)
    else
      render plain: "Fichier non trouvé", status: :not_found
    end
  end

  private

  def document_params
    params.require(:document).permit(:file)
  end
end
