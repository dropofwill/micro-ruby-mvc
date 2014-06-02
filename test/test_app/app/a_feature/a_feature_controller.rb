class AFeatureController < Rulers::Controller
	def index
		hash = {  submitter: "Some User", comment: "Added some feature data"}
		puts FileModel.create hash, self
		comments = FileModel.all self
		render :index, data: comments
	end

	def a_feature
		@controller_name = "AFeatureController"
		render :a_feature, noun: :winking
	end

	def data_1
		data_1 = FileModel.find 1, self
		render :data_1, data: data_1
	end
end