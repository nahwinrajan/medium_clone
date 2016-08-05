module CommentsHelper
  # => only last comment in the post can be edited by commenter
  def is_editable(comment)
    if comment.nil? || !user_signed_in?
      return false
    else
      last_comment = Comment.where(:story_id => comment.story_id).order(
      "created_at DESC").first

      logger.debug('-' * 30)
      logger.debug( "comment.user_id #{comment.user_id}" )
      logger.debug( "last_comment.user_id #{last_comment.user_id}" )
      logger.debug( "current_user.id #{current_user.id}" )
      logger.debug('=' * 30)

      if comment == last_comment && last_comment.user_id == current_user.id
        return true
      else return false
      end
    end
  end
end
