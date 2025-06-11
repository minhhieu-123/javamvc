    $(document).ready(function(){
            $('.quantity button').on('click',function(){
                let change = 0;
                var button=$(this);
                var oldValue = button.parent().parent().find('input').val();
                if (button.hasClass('btn-plus')){
                    var newVal = parseFloat(oldValue) + 1;
                    change = 1;
                } else {
                    if (oldValue > 1){
                        var newVal = parseFloat(oldValue) -1 ;
                        change = -1;
                    } else {
                        newVal = 1;
                    }
                }
                console.log(oldValue);
                console.log(newVal);
                // get price
                const input = button.parent().parent().find('input');
                input.val(newVal);

                const index = input.attr("data-cart-detail-index");
                const el = document.getElementById(`cartDetails${index}.quantity`);
                $(el).val(newVal);

                const price = input.attr("data-cart-detail-price");
                const id = input.attr("data-cart-detail-id");
                console.log(id + "sadas");
                const priceElement = $(`article[data-cart-detail-id='${id}']`);
               if (priceElement.length > 0) {
                    const newPrice = +price * newVal;
                    priceElement.text(formatCurrency(newPrice.toFixed(2)) + "đ");
                    console.log(newPrice + " new price");
                } else {
                    console.warn("Không tìm thấy article[data-cart-detail-id='" + id + "']");
                }

                const totalPriceElement = $(`p[data-cart-total-price]`);
                
                if(totalPriceElement && totalPriceElement.length){
                    const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
                    console.log(currentTotal +"currentTotal price");
                    let newTotal = +currentTotal;
                    if(change === 0){
                        newTotal = +currentTotal;
                    } else {
                        newTotal = change * (+price) + +currentTotal;
                    }
                    change = 0;
                    totalPriceElement?.each(function(index, element){
                        $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2))+ "đ")
                        $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
                    });
                }
                console.log(totalPriceElement+"total");
                console.log(priceElement+"price");
            });
           function formatCurrency(value){
                const formatter = new Intl.NumberFormat('vi-VN',{
                    style: 'decimal',
                    minimumFractionDigits: 0,
                });
                let formatted = formatter.format(value);
                formatted = formatted.replace(/\./g, ',');
                return formatted;
            }
$(document).ready(function () {
    const tabsSelector = "prod-tab__item";
    const contentsSelector = "prod-tab__content";

    const tabActive = `${tabsSelector}--current`;
    const contentActive = `${contentsSelector}--current`;

    $(".js-tabs").each(function () {
        const $tabContainer = $(this);
        const $tabs = $tabContainer.find(`.${tabsSelector}`);
        const $contents = $tabContainer.find(`.${contentsSelector}`);

        $tabs.each(function (index) {
            $(this).on("click", function () {
                $tabContainer.find(`.${tabActive}`).removeClass(tabActive);
                $tabContainer.find(`.${contentActive}`).removeClass(contentActive);

                $(this).addClass(tabActive);
                $contents.eq(index).addClass(contentActive);
            });
        });
    });
});
$(window).on("template-loaded", initJsToggle);

function initJsToggle() {
    $(".js-toggle").each(function () {
        const $button = $(this);
        const targetSelector = $button.attr("toggle-target");

        if (!targetSelector) {
            $("body").text(`Cần thêm toggle-target cho: ${$button.prop("outerHTML")}`);
            return;
        }

        const $target = $(targetSelector);
        if ($target.length === 0) {
            $("body").text(`Không tìm thấy phần tử "${targetSelector}"`);
            return;
        }

        $button.on("click", function (e) {
            e.preventDefault();
            const isHidden = $target.hasClass("hide");

            requestAnimationFrame(() => {
                $target.toggleClass("hide", !isHidden);
                $target.toggleClass("show", isHidden);
            });
        });

        $(document).on("click", function (e) {
            if (!$(e.target).closest(targetSelector).length) {
                if (!$target.hasClass("hide")) {
                    $button.trigger("click");
                }
            }
        });
    });
}
$('#btnFilter').click(function(event){
    event.preventDefault();
    let factoryArr=[];
    let targetArr=[];
    let priceArr= [];
    $("#factoryfilter .form-check-input:checked").each(function(){
        factoryArr.push($(this).val());
    });
     $("#targetfilter .form-check-input:checked").each(function(){
        targetArr.push($(this).val());
    });
     $("#pricefilter .form-check-input:checked").each(function(){
        priceArr.push($(this).val());
    });
    let sortValue = $('input[name="radio-sort"]:checked').val();
    const currentUrl = new URL(window.location.href);
    const searchParams = currentUrl.searchParams;

    searchParams.set('page','1');
    searchParams.set('sort',sortValue);

    if(factoryArr.length > 0){
        searchParams.set('brand',factoryArr.join(','));
    }
    if(targetArr.length > 0){
        searchParams.set('category',targetArr.join(','));
    }
    if(targetArr.length > 0){
        searchParams.set('price',priceArr.join(','));
    }
    window.location.href = currentUrl.toString();

});

    // const params = new URLSearchParams(window.location.search);

    // if(params.has('factory')){
    //     const factories = params.get('factory').split(',');
    // }
        });
