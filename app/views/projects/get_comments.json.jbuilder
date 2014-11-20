json.array! @comments do |comment|
  json.content comment.content
  json.created_at comment.created_at.strftime('%Y年%m月%d日')
  json.user_avatar comment.user.avatar.small.url
  json.user_name comment.user.name
end