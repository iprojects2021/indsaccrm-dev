const openModalButtons = document.querySelectorAll('[data-modal1-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal1 = document.querySelector(button.dataset.modal1Target)
    openModal(modal1)
  })
})

overlay.addEventListener('click', () => {
  const modal1s = document.querySelectorAll('.modal1.active')
  modal1s.forEach(modal1 => {
    closeModal(modal1)
  })
})

closeModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal1 = button.closest('.modal1')
    closeModal(modal1)
  })
})

function openModal(modal1) {
  if (modal1 == null) return
  modal1.classList.add('active')
  overlay.classList.add('active')
}

function closeModal(modal1) {
  if (modal1 == null) return
  modal1.classList.remove('active')
  overlay.classList.remove('active')
}