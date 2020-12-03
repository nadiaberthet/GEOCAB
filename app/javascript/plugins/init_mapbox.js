import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });
};


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, {padding: 50});
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement == null)
  return
  if (!mapElement.dataset.markersCompetitors){
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    fitMapToMarkers(map, markers);
    addMarkersToMap(map, markers);
    } else {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    const markersCompetitors = JSON.parse(mapElement.dataset.markersCompetitors);
    addMarkersToMap(map, markers);
    addMarkersToMap(map, markersCompetitors);
    fitMapToMarkers(map, markers);
  };
}; // if  il y a map element data set



export { initMapbox };
