import PropTypes from "prop-types";

const Wish = (props) => {
  return (
    <div className="wish card">
      <div className="card-content">
        <h2>{props.wisher}</h2>
        <p>Wishes for: {props.title}</p>
      </div>
    </div>
  );
};

Wish.propTypes = {
  wisher: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
};

export default Wish;
