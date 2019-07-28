filepath <- '/home/jeff/Documents/Family Histories/Porter/'

data <- read.csv(paste0(filepath, 'people.csv'), na.strings='', stringsAsFactors=FALSE)

children <- data.frame(id=character(0), birth_order=numeric(0), parent_id=character(0), child_id=character(0), stringsAsFactors=FALSE)

row_count <- 1
child_count <- 1
for (i in 1:nrow(data)) {
    add_count <- FALSE
    parent_count <- 1
    
    if (!is.na(data[i, 'parent1_id'])) {
        children[row_count, 'id'] <- paste0('c', child_count, letters[parent_count])
        children[row_count, 'birth_order'] <- data[i, 'birth_order']
        children[row_count, 'parent_id'] <- data[i, 'parent1_id']
        children[row_count, 'child_id'] <- data[i, 'id']
        parent_count <- parent_count + 1
        row_count <- row_count + 1
        add_count <- TRUE
    }
    
    if (!is.na(data[i, 'parent2_id'])) {
        children[row_count, 'id'] <- paste0('c', child_count, letters[parent_count])
        children[row_count, 'birth_order'] <- data[i, 'birth_order']
        children[row_count, 'parent_id'] <- data[i, 'parent2_id']
        children[row_count, 'child_id'] <- data[i, 'id']
        parent_count <- parent_count + 1
        row_count <- row_count + 1
        add_count <- TRUE
    }
    
    if (!is.na(data[i, 'parent3_id'])) {
        children[row_count, 'id'] <- paste0('c', child_count, letters[parent_count])
        children[row_count, 'birth_order'] <- data[i, 'birth_order']
        children[row_count, 'parent_id'] <- data[i, 'parent3_id']
        children[row_count, 'child_id'] <- data[i, 'id']
        parent_count <- parent_count + 1
        row_count <- row_count + 1
        add_count <- TRUE
    }
    
    if (add_count) {
        child_count <- child_count + 1
    }
}

write.csv(children, paste0(filepath, 'children.csv'), na='', row.names=FALSE)



