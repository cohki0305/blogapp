import $ from 'jquery'
import axios from 'modules/axios'
import { listenInactiveHeartEvent, listenActiveHeartEvent } from 'modules/handle_heart'

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active_heart').removeClass('hidden')
  } else {
    $('.inactive_heart').removeClass('hidden')
  }
}

document.addEventListener('turbolinks:load', () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

  listenInactiveHeartEvent(articleId)
  listenActiveHeartEvent(articleId)

  axios.get(`/articles/${articleId}/comments`)
    .then((res) => {
      const comments = res.data
      comments.forEach((comment) => {
        $('.comments-container').append(
          `<div class="article_comment"><p>${comment.content}</p></div>`
        )
      })
    })

  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_conent').val()
    axios.post(`/articles/${articleId}/comments`, {
      comment: { content: content }
    })
      .then((res) => {
        const comment = res.data
        $('.comments-container').append(
          `<div class="article_comment"><p>${comment.content}</p></div>`
        )
        $('#comment_conent').val('')
      })
      .catch((e) => {
        debugger
      })
  })
})
