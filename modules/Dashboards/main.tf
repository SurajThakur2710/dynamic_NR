# resource "newrelic_one_dashboard" "dashboard" {
#   for_each = var.dashboards

#   name        = each.value.name
#   description = each.value.description

#   dynamic "page" {
#     for_each = each.value.pages
#     content {
#       name = page.value.name

#       dynamic "widget" {
#         for_each = page.value.widgets
#         content {
#           title = widget.value.title

#           dynamic "nrql" {
#             for_each = widget.value.type == "nrql" ? [widget.value.settings] : []
#             content {
#               nrql      = nrql.value.query
#               account_id = nrql.value.account_id
#             }
#           }

#           dynamic "markdown" {
#             for_each = widget.value.type == "markdown" ? [widget.value.settings] : []
#             content {
#               text = markdown.value.text
#             }
#           }

#           dynamic "area" {
#             for_each = widget.value.type == "area" ? [widget.value.settings] : []
#             content {
#               nrql      = area.value.query
#               account_id = area.value.account_id
#             }
#           }

#           dynamic "bar" {
#             for_each = widget.value.type == "bar" ? [widget.value.settings] : []
#             content {
#               nrql      = bar.value.query
#               account_id = bar.value.account_id
#             }
#           }

#           dynamic "line" {
#             for_each = widget.value.type == "line" ? [widget.value.settings] : []
#             content {
#               nrql      = line.value.query
#               account_id = line.value.account_id
#             }
#           }

#           dynamic "pie" {
#             for_each = widget.value.type == "pie" ? [widget.value.settings] : []
#             content {
#               nrql      = pie.value.query
#               account_id = pie.value.account_id
#             }
#           }

#           dynamic "table" {
#             for_each = widget.value.type == "table" ? [widget.value.settings] : []
#             content {
#               nrql      = table.value.query
#               account_id = table.value.account_id
#             }
#           }

#           dynamic "heatmap" {
#             for_each = widget.value.type == "heatmap" ? [widget.value.settings] : []
#             content {
#               nrql      = heatmap.value.query
#               account_id = heatmap.value.account_id
#             }
#           }

#           // Add more widget types here dynamically
#         }
#       }
#     }
#   }
# }

# resource "newrelic_one_dashboard" "dashboard" {
#   for_each = var.dashboards

#   name        = each.value.name
#   description = each.value.description

#   dynamic "page" {
#     for_each = each.value.pages
#     content {
#       name = page.value.name

#       dynamic "widget" {
#         for_each = page.value.widgets
#         content {
#           title = widget.value.title
#           row   = widget.value.row
#           column = widget.value.column

#           dynamic "nrql_query" {
#             for_each = widget.value.type == "nrql" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "markdown" {
#             for_each = widget.value.type == "markdown" ? [1] : []
#             content {
#               text = widget.value.settings.text
#             }
#           }

#           dynamic "area" {
#             for_each = widget.value.type == "area" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "bar" {
#             for_each = widget.value.type == "bar" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "line" {
#             for_each = widget.value.type == "line" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "pie" {
#             for_each = widget.value.type == "pie" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "table" {
#             for_each = widget.value.type == "table" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           dynamic "heatmap" {
#             for_each = widget.value.type == "heatmap" ? [1] : []
#             content {
#               nrql_query {
#                 query      = widget.value.settings.query
#                 account_id = widget.value.settings.account_id
#               }
#             }
#           }

#           // Add more widget types here dynamically
#         }
#       }
#     }
#   }
# }


resource "newrelic_one_dashboard" "dashboard" {
  for_each = var.dashboards

  name        = each.value.name
  description = each.value.description

  dynamic "page" {
    for_each = each.value.pages
    content {
      name = page.value.name

      # Explicitly define each widget type
      dynamic "widget_area" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "area" }
        content {
          title = widget_area.value.title
          row   = widget_area.value.row
          column = widget_area.value.column

          nrql_query {
            query      = widget_area.value.settings.query
            account_id = widget_area.value.settings.account_id
          }
        }
      }

      dynamic "widget_bar" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "bar" }
        content {
          title = widget_bar.value.title
          row   = widget_bar.value.row
          column = widget_bar.value.column

          nrql_query {
            query      = widget_bar.value.settings.query
            account_id = widget_bar.value.settings.account_id
          }
        }
      }

      dynamic "widget_billboard" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "billboard" }
        content {
          title = widget_billboard.value.title
          row   = widget_billboard.value.row
          column = widget_billboard.value.column

          nrql_query {
            query      = widget_billboard.value.settings.query
            account_id = widget_billboard.value.settings.account_id
          }
        }
      }

      dynamic "widget_bullet" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "bullet" }
        content {
          title = widget_bullet.value.title
          row   = widget_bullet.value.row
          column = widget_bullet.value.column
          limit = widget_bullet.value.limit

          nrql_query {
            query      = widget_bullet.value.settings.query
            account_id = widget_bullet.value.settings.account_id
          }
        }
      }

      dynamic "widget_funnel" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "funnel" }
        content {
          title = widget_funnel.value.title
          row   = widget_funnel.value.row
          column = widget_funnel.value.column

          nrql_query {
            query      = widget_funnel.value.settings.query
            account_id = widget_funnel.value.settings.account_id
          }
        }
      }

      dynamic "widget_json" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "json" }
        content {
          title = widget_json.value.title
          row   = widget_json.value.row
          column = widget_json.value.column

          nrql_query {
            query      = widget_json.value.settings.query
            account_id = widget_json.value.settings.account_id
          }
        }
      }

      dynamic "widget_heatmap" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "heatmap" }
        content {
          title = widget_heatmap.value.title
          row   = widget_heatmap.value.row
          column = widget_heatmap.value.column

          nrql_query {
            query      = widget_heatmap.value.settings.query
            account_id = widget_heatmap.value.settings.account_id
          }
        }
      }

      dynamic "widget_histogram" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "histogram" }
        content {
          title = widget_histogram.value.title
          row   = widget_histogram.value.row
          column = widget_histogram.value.column

          nrql_query {
            query      = widget_histogram.value.settings.query
            account_id = widget_histogram.value.settings.account_id
          }
        }
      }

      dynamic "widget_line" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "line" }
        content {
          title = widget_line.value.title
          row   = widget_line.value.row
          column = widget_line.value.column

          nrql_query {
            query      = widget_line.value.settings.query
            account_id = widget_line.value.settings.account_id
          }
        }
      }

      dynamic "widget_markdown" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "markdown" }
        content {
          title = widget_markdown.value.title
          row   = widget_markdown.value.row
          column = widget_markdown.value.column
          text = widget_markdown.value.settings.text

         
        }
      }

      dynamic "widget_stacked_bar" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "stacked_bar" }
        content {
          title = widget_stacked_bar.value.title
          row   = widget_stacked_bar.value.row
          column = widget_stacked_bar.value.column

          nrql_query {
            query      = widget_stacked_bar.value.settings.query
            account_id = widget_stacked_bar.value.settings.account_id
          }
        }
      }

      dynamic "widget_pie" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "pie" }
        content {
          title = widget_pie.value.title
          row   = widget_pie.value.row
          column = widget_pie.value.column

          nrql_query {
            query      = widget_pie.value.settings.query
            account_id = widget_pie.value.settings.account_id
          }
        }
      }

      dynamic "widget_log_table" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "log_table" }
        content {
          title = widget_log_table.value.title
          row   = widget_log_table.value.row
          column = widget_log_table.value.column

          nrql_query {
            query      = widget_log_table.value.settings.query
            account_id = widget_log_table.value.settings.account_id
          }
        }
      }

      dynamic "widget_table" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "table" }
        content {
          title = widget_table.value.title
          row   = widget_table.value.row
          column = widget_table.value.column

          nrql_query {
            query      = widget_table.value.settings.query
            account_id = widget_table.value.settings.account_id
          }
        }
      }
    }
  }
}