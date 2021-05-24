;
/*
 * @name : jquery.utils.event.js
 * @type : function
 * @depends : jquery.js
 */
(function( $, window, document, undefined){

    /*
	 * @name : jquery.tileGallery
	 * @desc : default column : 3, 
	*/
	$.fn.tileGalleryEvent = function (options) {

        var morebutton = false;
		var defaults = {
				'type' : 'general', // 'general', 'event', 'none' <= 수동 클릭 설정
				'data' : [],
				'limit' : 9,
                'moreClick' : null,				
                'callback' : null       //item 1개씩 추가 후 event
			},
			config = $.extend(defaults, options);


		return this.each(function(i, v) {
			var $this = $(v),
				$win = $(window),
				$moreButton = $("#btnMoreData"),
				maxItemCount = 0,
				imagesListPointer = 0,                
				totalImagesCount = config.data.length,
				loadedItems = new Array(totalImagesCount),
				loadedItemsCount = 0,
				bottomMargin = -10;


			// 데이터가 선언되지 않은채 넘어왔을 경우, 빈데이터 형식으로 초기화.
			if(totalImagesCount === undefined) {
				//app.log('current data is undefined. data length will be 0.');
				config.data = [];
				totalImagesCount = 0;
			}
			
			
			// 데이터가 없을 경우 처리
			if(totalImagesCount === 0) {
				//app.log('data length is 0. morebutton will be hide and no image text will be appear.');
				//$this.text('No Images'); // ToDo:데이터 없을 경우 페이지 렌더링 처리는 이곳에 추가.
				$moreButton.hide(); 
			} else {
				$this.on("LoadMoreItemEvent", onLoadMoreItemEventHandler);	
			}

			/*
			* image load event handler           
			* @type : EVENT
			*/
			function onLoadMoreItemEventHandler(e) {
				app.loading().show(5); // show progress while loading images.

				imagesListPointer = maxItemCount;
                if ($this.morebutton == true){
                    maxItemCount = maxItemCount + 9;
                    //alert("moreClick:" + $this.morebutton + "/maxItemCount:" + maxItemCount);
                } else {
                    maxItemCount = maxItemCount + config.limit;
                    //alert("moreClick:" + $this.morebutton + "/maxItemCount:" + maxItemCount);
                }
				

				// break loading image process 
				if(maxItemCount >= totalImagesCount) {
					maxItemCount = totalImagesCount;
					$this.off("LoadMoreItemEvent");
					//app.log('every items are loaded complete.');
					$moreButton.hide(); // hide button when it doesn't necessary. ex.) total image count is under 20.
				}
				
				

				for (var i=imagesListPointer; i < maxItemCount; i++) {	
					var tempImg = new Image();
					tempImg.index = i;
					
					tempImg.onload = function() {
                        //app.log("로드됐어~:" + this.src);
                        //app.log("몇번?::::" + this.index);
						addToLoadedItems(this);
					};
					tempImg.onerror = function(e){
                        //app.log("ON ERROR 이미지야! 몇번?::::" + this.index);
						addToLoadedItems(this, e);
					};

                    tempImg.src = config.data[i]['imageUrl'];
				}
			}
			

			/*
			* input item from tempImg attr to loadedItems
			*
			* @param {Image()} _this : image object has a source, index
			* @param {object} it will added when loading fail.
			*/
			function addToLoadedItems(_this, error) {
				var item = {}, url = _this.src,  alt = '', w = _this.width, h = _this.height, index = _this.index, 
                    link='', errorImage = {}, eventTerm='', spanDay='';
                
				if(config.data[index]['description']) {
					alt = config.data[index]['description'];
				}

                if(config.data[index]['eventTerm']) {
					eventTerm = config.data[index]['eventTerm'];
				}

                if(config.data[index]['spanDay']) {
					spanDay = config.data[index]['spanDay'];
				}

                link = config.data[index]['link'];

				item = { "index": index, "url": url, "width": w, "height": h, "alt":alt, "eventTerm":eventTerm, "spanDay":spanDay, "link": link };

				if(error) {
					if(config.type === 'event') {
						errorImage = { "url": window._NO_IMAGE.landscape, "link":link,"alt":alt };
					} else {
						errorImage = { "url": window._NO_IMAGE.square, "link":link,"alt":"default error image" };
					}
					item = $.extend(item, errorImage);
				}

				// if(config.type === 'event') { // event type need more property
				// 	item = $.extend(item, {"link": config.data[index]['link'], "target": config.data[index]['target'] || ''});  // add link, target to item
				// 	var reverseStopPoint = totalImagesCount - (totalImagesCount%3);
				// 	if(index >= reverseStopPoint) {
				// 		index = index;
				// 	} else {
				// 		var indexThreshold = index % 3;
				// 		if(indexThreshold == 0) {
				// 			index = index + 2;
				// 		} else if(indexThreshold == 2) {
				// 			index = index - 2;
				// 		} else {
				// 			index = index;
				// 		}
				// 	}
				// }
				loadedItems[index] = item;
				loadedItemsCount++; // @ triggerAddItem
				triggerAddItem();
			}

			/*
			* @ onLoadMoreItemEventHandler
			* start AddItemEvent after every image loaded complete.
			*/
			function triggerAddItem(){
				if (maxItemCount == loadedItemsCount) {
					$this.trigger("AddItemEvent");
				}
			}

			/*
			* add image to list event. triggered after load images.
			* @type : EVENT
			*/
			$this.on("AddItemEvent", onAddItemEventHandler);
			function onAddItemEventHandler(e) {	
				if(maxItemCount > totalImagesCount) {
					$this.off("LoadMoreImageEvent"); // unbind load event after every images loaded complete.
				}
				
				for (var i=imagesListPointer; i < maxItemCount; i++) {
					addItemToContainer(loadedItems[i]);				
				}				
				// add item count text to more button while existing
				if($moreButton.is(':hidden') === false) {
					//$this.find("div").eq(imagesListPointer).find("a").focus(); //(이 포커스 때문에 스크롤 움직임!)
				} else {
					$this.trigger("LoadMoreItemEvent");
					//$this.find("div").eq(config.limit).find("a").focus(); // 나머지 전체로딩으로 변경됨에 따라 추가로딩된 첫번째 아이템에 focus가 가도록 변경. (이 포커스 때문에 스크롤 움직임!)
				}

				app.loading().hide(); // hide progress after finishing add images.

                
                //아이템 추가 후 호출할 event있는지 check
                if (typeof config.callback == 'function') {
                    config.callback(config.data);
                }
			}


			function getArrayIndex(array, value) {
				for(var i=0; i<array.length; i++) {
					if(value === array[i]) return i;
				}
			}

			/* 
			* @ onAddItemEventHandler
			* set container height
			*/
			function addItemToContainer(target) {
				var strDay = '';
				target['spanDay'] === '' ? strDay = '' : strDay = 'data-dDay="'+ target['spanDay'] + '"';
				
				var url = target['url'], 
					index = target['index'], 
					alt = target['alt'],
                    eventTerm = target['eventTerm'],
                    spanDay = strDay ; // ankh 수정 '<span> . </span><em>' + target['spanDay'] + '</em>',
					minVal = Math.min.apply(Math, config.listHeights),				
					$returnValue = $('<li><a id="tile_' + index + '" href="'+target['link']+'"><div class="evt-thumb"></div><strong class="cgvSaleTxt">'+ alt + '</div></strong><span class="cgvSalePeriod"'+ spanDay+'">' +eventTerm + '</span></a></li>'),
					$a = $returnValue.find("a").filter(":first");   
					$thumb = $returnValue.find(".evt-thumb");
				switch(config.type) {
					case 'event':
						var link = target['link'], linkTarget = target['target'];
						//$a.attr("href", link);
						$a.attr("target", linkTarget);
						$a.find('.txt1').text(alt);
						break;
                    case 'none':
                        break;
					case 'general':
						// Same as Default
					default:
						$a.on("click", function(e) {
                            //app.log('## click');
							e.preventDefault();
							app.instWin.add({'type': 'photo', 'data' : config.data, 'offset': index, 'more' : loadMoreItem, 'mask' : true});
							return false;
						});
						break;
				}

                $('<img>').attr({ 'src': url, 'alt': alt, 'width': '314', 'height':'196' }).on('error', function (e) { errorImage(this, { type: 'square' }); }).appendTo($thumb);
				// config.listHeights[columnNum] = config.listHeights[columnNum] + height + config.imageMargin; // update list height list as current value;

				$returnValue.data("index", target['index']);
				$this.append($returnValue); 
			}


			/* Get More itmes */
			// click : load more image
			
			$moreButton.on("click", loadMoreItem);

			function loadMoreItem() {
                $this.morebutton = true;
				$this.trigger("LoadMoreItemEvent");

				if(config.type === 'general') {
					$moreButton.hide();  // morebtn will be show every limit in event
				}
			}

			// start load item event at first time.
			$this.trigger("LoadMoreItemEvent");

		 });
	};

})( jQuery, window, document );


var setPagingNavigation_V1 = function (totalCount, pageSize, pagingId, containerId, hash, callback) {

    if (totalCount < 1) {
        $(pagingId).empty();
        $(containerId).html("<li style='width:100%;text-align:center;padding:30px 0;'>해당 조건에 데이터가 존재하지 않습니다.</li>");
        return;
    }

    var pageCount = parseInt(Math.ceil(totalCount / pageSize));   //pageCount

    var page = 1;
    if (hash == '') {
        page = page;
    }
    else {
        page = hash;
    }

    $(pagingId).paging(
        {
            max: pageCount,
            item: 'li',
            itemCurrent: 'on',
            itemClass: '',
            format: '<a href="#{0}" title="{7}">{0}</a>',
            first: '<a href="#{0}" title="{7}" class="btn-paging first" >처음</a>',
            prev: '<a href="#{0}" title="{7}" class="btn-paging prev">이전 10개</a>',
            next: '<a href="#{0}" title="{7}" class="btn-paging next" >다음 10개</a>',
            last: '<a href="#{0}" title="{7}" class="btn-paging end" >끝</a>',
            current: page,
            onclick: function (e, page) {
                if (typeof callback === "function") {
                    callback(page);
                }
            }
        }
    );

};