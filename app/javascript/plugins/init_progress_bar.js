const updateProgressBar = () =>{
  const progressBar = document.querySelector('.progress-bar')
  progressBar.style.width = parseInt(progressBar.dataset.percent).toFixed() + '%'
};

const updateBadge = (percent) => {
  console.log(document.querySelector('#percentage'))
  document.querySelector('#percentage').innerHTML = percent.toFixed() + '%'
}

const checkboxChanged = (_e) => {
  const total = document.querySelectorAll('.checkbox-round').length;
  const totalChecked = document.querySelectorAll('.checkbox-round:checked').length
  const percent = 100 * totalChecked / total
  document.querySelector('.progress-bar').dataset.percent = percent
  updateProgressBar()
  updateBadge(percent)
}

const initProgressBar = () => {
  if (document.querySelector('.progress-bar') == null)
    return

  updateProgressBar()
  document.querySelectorAll('.checkbox-round').forEach((checkbox) => {
    checkbox.addEventListener('change', checkboxChanged)
  })
};

export { initProgressBar };

