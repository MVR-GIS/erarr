#' @title Milestone Plot
#'
#' @description Creates a milestone chart
#'
#' @param riskitem   data frame; A data frame of a filtered risk item.
#' @param milestonedf data frame; A data frame of phase-milestone pairings
#'
#' @return A ggplot of current milestone on timeline of all project milestones.
#'
#' @examples
#' # Get milestone data and risk item
#' # milestonedf <- read_csv("inst/app/data/erisk_phase_milestone.csv")
#' # milestone_df <- data.frame(milestonedf)
#'
#' # riskitem <- erarr::erisk_item
#'
#' # milestone_plot <- milestoneplot(riskitem = riskitem, 
#' #                                 milestonedf = milestone_df)
#'
#' @importFrom dplyr filter mutate arrange
#' @importFrom rlang .data
#' @importFrom ggplot2 ggplot aes geom_segment geom_point geom_text 
#'             scale_y_continuous coord_cartesian theme position_nudge 
#'             element_blank unit ggsave
#' @importFrom stringr str_wrap
#' @importFrom forcats fct_inorder
#' @export
#'

milestoneplot<- function(riskitem, milestonedf){
projphases<- milestonedf |>
  dplyr::filter(PHASEID == riskitem$PROJECTPHASEID)|>
  dplyr::mutate('yval' = rep(0.1))

mileplot <- ggplot(projphases, 
                  aes(x = ID, level = ORDERBY, y = yval)) +
  geom_segment(x = min(projphases$ID), y = 0.1, xend = max(projphases$ID), yend = 0.1, 
               linewidth = 1, color = "grey") +
  geom_point(size = 7,color = "grey", fill = "snow1", 
             shape = 21, stroke = .75) +
  geom_point(aes(x = riskitem$PROJECTMILESTONEID, y = 0.1), 
             colour = "#1F78B4", fill = "#1F78B4", shape = 16, size = 4) +
  geom_text(aes(label = str_wrap(MILESTONE, width=14)), 

            position = position_nudge(y = -0.55), size = 3) +
  scale_y_continuous(limits = c(-1, 1), expand = c(0, 0)) +
  coord_cartesian(clip = "off") +
  theme(line = element_blank(),
        title = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.length = unit(0, "pt"),
        panel.background = element_blank(),
        plot.margin = unit(c(0, 0, 0 ,0), "mm")
        )

mileplot <- ggsave("mileplot.png", dpi = 600)
return(mileplot)
}
