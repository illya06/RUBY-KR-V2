class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        return false unless user
        true
    end

    def show?
        record.status == "public" || author? || admin?
    end

    def update?
        author?
    end

    def destroy?
        author?
    end

    private
    def author?
        return false unless user
        record.author_id == user.id
    end
end