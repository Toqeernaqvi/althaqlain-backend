class Api::HotelsController < ApplicationController
    before_action :authenticate_admin!, except
end  