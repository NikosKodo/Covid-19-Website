const myMap = L.map('map').setView([38.2462420, 21.7350847], 16);
const tileUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
const attribution =
        '&copy; <a href="https://www.openstreetmap.org/copyright">';
const tileLayer = L.tileLayer(tileUrl, { attribution });
tileLayer.addTo(myMap);

function generateList() {
  const ul = document.querySelector('.list');
  storeList.forEach((shop) => {
    const li = document.createElement('li');
    const div = document.createElement('div');
    const a = document.createElement('a');
    const p = document.createElement('p');
    a.addEventListener('click', () => {
        flyToStore(shop);
    });
    div.classList.add('shop-item');
    a.innerText = shop.properties.name;
    a.href = '#';
    p.innerText = shop.properties.address;

    div.appendChild(a);
    div.appendChild(p);
    li.appendChild(div);
    ul.appendChild(li);
  });
}

generateList();

function makePopupContent(shop) {
  return `
    <div>
        <h4>${shop.properties.name}</h4>
        <p>${shop.properties.address}</p>
        <div class="phone-number">
            <a href="tel:${shop.properties.phone}">${shop.properties.phone}</a>
        </div>
    </div>
  `;
}
function onEachFeature(feature, layer) {
    layer.bindPopup(makePopupContent(feature), { closeButton: false, offset: L.point(0, -8) });
};

const shopsLayer = L.geoJSON(storeList, {
    onEachFeature: onEachFeature,
    pointToLayer: function(feature, latlng) {
        return L.marker(latlng,);
      }
});
shopsLayer.addTo(myMap);




const circlelayer = L.geoJSON(storeList, {
    onEachFeature: onEachFeature,
    pointToLayer: function(feature, katlng) {
    return L.circle(katlng,{
        radius:25,
        color: 'red'    
        });
    }
});
circlelayer.addTo(myMap);



//////////////////////////////////////////////////////////////////////////////////////////////

//heatmap test

//let kododata= [{lat: 21.734881103038788,
    //lng: 38.24957029858446, count:3}]; 

//let cfg = {
    //"radius": 40,
    //"maxOpacity": 0.8,
    
    //"scaleRadius": false,
   
     //"useLocalExtrema": false,
   
    //latField: 'lat',
   
    //lngField: 'lng',
   
    //valueField: 'count'
  //}
 //let heatmapLayer =  new HeatmapOverlay(cfg);
  //myMap.addLayer(heatmapLayer);
 //heatmapLayer.setData(kododata);

//////////////////////////////////////////////////////////////////////////////////////////////

function flyToStore(store) {
    const lat = store.geometry.coordinates[1];
    const lng = store.geometry.coordinates[0];
    myMap.flyTo([lat, lng], 18,5, {
        duration: 0
    });
    setTimeout(() => {
        L.popup({closeButton: false, offset: L.point(0, -8)})
        .setLatLng([lat, lng])
        .setContent(makePopupContent(store))
        .openOn(myMap);
    }, 3000);
}