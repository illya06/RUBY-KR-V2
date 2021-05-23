class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end

    def unpublished?
        user_logged_in?
    end

    def create?
        return false unless user
        true
    end

    def show?
        record.status == "public" || author? || admin?
    end

    def update?
        author? || admin?
    end

    def destroy?
        author? || admin?
    end

    private
    def author?
        user_logged_in? && record.author_id == user.id
    end
end