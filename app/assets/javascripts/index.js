$(document).ready(function() {
    $('.coin-insert').click(function() {
        insert_coin($(this));
    });

    $('.clear-balance').click(function() {
        $('#purchase-div').hide();
        $('#return-div').show();
        $('#return-div').html('<h5>Returned: ' + $('#balance').val() + ' cents.');
        set_balance_fields(0);
    });

    $('.product-quantity').change(function() {
        update_total_cost();
    });

    $('#vend').click(function() {
        vend();
    });
});

function insert_coin(coin_button) {
    var amount = Number(coin_button.val()) + Number($('#display-balance').html());
    set_balance_fields(amount);
    $('#insufficient-funds').hide();
}

function set_balance_fields(amount) {
    $('#display-balance').html(amount);
    $('#balance').val(amount);
}

function update_total_cost() {
    var total_cost = 0;
    $('.product-quantity').each(function() {
        if(Number($(this).attr('data-quantity')) < Number($(this).val())) {
            $(this).val($(this).attr('data-quantity'));
        }
        total_cost += $(this).attr('data-cost') * $(this).val();
    });

    $('#total-cost').html(total_cost);
}

function vend() {
    var products = [];
    var quantities = [];
    var total_cost = 0;
    $('.product-quantity').each(function() {
        if($(this).val() > 0) {
            products.push($(this).attr('name'));
            quantities.push($(this).val());
            total_cost += Number($(this).attr('data-cost')) * $(this).val();
        }
    });
    if (sufficient_funds(total_cost)) {
        $('#products').val(products.join());
        $('#quantities').val(quantities.join());
        $('#products-form').submit();
    }
    else {
        $('#insufficient-funds').show();
        $('#insufficient-funds').html('Insufficient funds! Please insert more money!');
    }
}

function sufficient_funds(cost) {
    return cost <= $('#balance').val();
}