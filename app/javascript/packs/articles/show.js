import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

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

  $('.inactive_heart').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').removeClass('hidden')
          $('.inactive_heart').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('error')
      })
  })

  $('.active_heart').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active_heart').addClass('hidden')
          $('.inactive_heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('error')
      })
  })

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
