class DocumentsController < ApplicationController

	def index
		documents = Document.all
		render json: {status: 'SUCCESS', message: 'Loaded documents', data: documents}, status: :ok
	end

	def show
		document = Document.find(params[:id])
		render json: {status: 'SUCCESS', message: 'Loaded document', data: document}, status: :ok
	end

	def create
		document = Document.new(document_params)
		if document.save
			render json:{status: 'SUCCESS', message: 'Saved document', data: document}, status: :ok
		else
			render json:{status: 'ERROR', message: 'Document not saved', data: document.erros}, status: :unprocessable_entity
		end
	end

	private

	def document_params
		params.permit(:title, :content)
	end

end