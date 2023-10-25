class SupportRequestsController < ApplicationController
    def index
        @support_requests = SupportRequest.order(created_at: :desc)
    end

    def update
        support_request = SupportRequest.find(params[:id])
        support_request.update(response: params.require(:support_request)[:response])
        SupportRequestMailer.respond(support_request).deliver_now
        redirect_to support_requests_path
    end
end





# Komentarz
# 
# .order()      - Jest metodą, która pozwala na określenie kolejności sortowania rekordów w bazie danych.
# created_at    - Nazwa kolumny, według której chcesz posortować rekordy.
# :desc         - Skrót od "malejący" (descending). Oznacza to, że rekordy zostaną posortowane od najnowszego do najstarszego.