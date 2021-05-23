class CommentPolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        return false unless user
        true
    end

    def show?
        true
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
        record.commenter == user.email
    end
end