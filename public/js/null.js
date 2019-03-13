var nullable_relations = [
    'items.teaser1',
];

nullable_relations.forEach(function (relation_key) {
    [table, field] = relation_key.split('.');

    var select_item = jQuery('body.voyager.'+table+' [name='+field+']');
    // Add the "None" option
    select_item.prepend(
        jQuery("<option></option>")
            .attr('value','')
            .text('None')
    );

    // Select it when editing an item that has a null relation
    if (jQuery('body.voyager.'+table+' [name='+field+'] option:selected').attr('selected') === undefined) {
        select_item.val('').change();
    }
});