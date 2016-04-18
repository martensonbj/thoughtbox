var AllLinks = React.createClass({
  getInitialState(){
    return {links: []};
  },

  componentDidMount() {
    $.getJSON('/api/v1/links.json', (response) => { console.table("HI" + response) });
  },

  render() {
    return (
      <div>
        <h1>Hello from New Link!</h1>
      </div>
    );
  }
});
