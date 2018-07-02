class DoctorsReviewsController < ApplicationController
  # GET /doctorsreviews
  def index
    @doctors_reviews = DoctorsReview.all
    final_set = []
    @doctors_reviews.each do |review|
      doctor_info = Doctor.find(review.doctors_id)
      author_info = Author.find(review.authors_id)
      info = {  doctor_name: doctor_info.name,
                author_name: author_info.name,
                comments: review.comments,
                rating: review.rating }
      final_set << info
    end
    final_set
  end

  # GET /doctorsreviews/1
  def show
    @doctors_reviews = DoctorsReview.find(params[:id])
  end

  # GET /doctorsreviews/new
  def new
    @doctors_reviews = DoctorsReview.new
  end

  # GET /doctorsreviews/1/edit
  def edit
    @doctors_reviews = DoctorsReview.find(params[:id])
  end

  # POST /doctorsreviews
  def create
    final_set = []
    params['doctors_review'].permit!
    doctors_id = params['doctors_review']['doctors_id']
    specialties_id = DoctorsSpecialty.where(doctors_id: doctors_id).first
                                     .specialties_id
    specialty = Specialty.find(specialties_id)
    unless specialties_id.nil?
      params['doctors_review']['specialties_id'] = specialties_id
    end
    @doctors_reviews = DoctorsReview.new(params['doctors_review'])
    if @doctors_reviews.save
      rating = params['doctors_review']['rating']
      unless rating.nil?
        all_reviews = DoctorsReview.where(specialties_id: specialties_id)
                                   .where('rating >= ?', rating).order('rating')
        all_reviews&.each do |review|
          doctor = Doctor.find(review['doctors_id'])
          recommendations = { specialty: specialty.name,
                              doctor: doctor.name,
                              rating: review.rating,
                              comments: review.comments
            }
          final_set << recommendations
        end
      end
      final_set
    else
      @doctors_reviews.errors.full_messages
    end
  end

  # PUT /doctorsreviews/1
  def update
    @doctors_reviews = DoctorsReview.find(params[:id])
    params['doctors_review'].permit!
    if @doctors_reviews.update_attributes(params['doctors_review'])
      'updated'
    else
      @doctors_reviews.errors.full_message
    end
  end

  # DELETE /doctorsreviews/1
  def destroy
    @doctors_reviews = DoctorsReview.find(params[:id])
    @doctors_reviews.destroy
  end
end
