function change()
{
  if(document.getElementById('tweetcheck').checked)
     document.getElementById('tweettext').disabled = '';
  else
     document.getElementById('tweettext').disabled = 'disabled';
}