sendEmail <- function(from, to, plaintext, html, inline, subject, attachment, url, api_key){
  if(!is.na(html)) html <- readChar(html, nchars = file.info(html)$size)
  if(!is.na(inline)) html <- inline
  if(!is.na(attachment)) attachment <- httr::upload_file(attachment)
  the_body <-
    list(
      from=from,
      to=to,
      subject=subject,
      text=plaintext,
      html=html,
      attachment=attachment
    )
  req <- httr::POST(url,
                    httr::authenticate("api", api_key),
                    encode = "multipart",
                    body = the_body[!is.na(the_body)])
  httr::stop_for_status(req)
}
