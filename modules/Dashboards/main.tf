resource "newrelic_one_dashboard" "HotelBooking_dashboard" {
  for_each = var.dashboard
  name = each.value.name
  dynamic  "page" {
   for_each = each.value.pages
    content {
      name = pages.value.name

      dynamic "widgets" {
        for_each = pages.value.widget
        content {
          type   = widgets.value.type
          title  = widgets.value.title
          x      = widgets.value.x
          y      = widgets.value.y
          width  = widgets.value.width
          height = widgets.value.height
          }
     }
    }
   }
}