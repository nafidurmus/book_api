module Api::V1 
  class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :destroy]

      # GET /books
      def index
        @books = Book.all

        render json: @books
      end

      # GET /books/1
      def show
        @book = Book.find_by_id(params[:id])
        @book ? (render json: @book) : (render json: { errors: @book.errors.full_messages })
      end

      # POST /books
      def create
        @book = Book.new(book_params)

        if @book.save
           render json: @book, status: :created
        else
          render json: { errors: @book.errors.full_messages },
               status: :unprocessable_entity
        end
      end  


      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # DELETE /books/1
      def destroy
        @book = Book.find_by_id(params[:id])
      unless @book&.destroy
        render json: { errors: 'Book not found' }, status: :not_found
      end
        render json: { notice: 'Book was successfully destroyed' }
      end

      private
        def set_book
          @book = Book.find(params[:id])
        end
    
        def book_params
          params.permit(:author, :country, :language, :link, :pages, :year)
        end
    end
end