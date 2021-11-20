import { render } from "react-dom";
import Wish from "./Wish";

const wishes = [
  { wisher: "Luna", title: "Go to dinner" },
  { wisher: "Steve", title: "A new car!" },
  { wisher: "Jimmy", title: "My two front teeth" },
];

const App = () => {
  return (
    <div>
      <h1>Open Wish</h1>
      <div className="cards">
        {wishes.map((wish) => (
          <Wish
            key={`${wish.wisher}${wish.wisher}`}
            wisher={wish.wisher}
            title={wish.title}
          />
        ))}
      </div>
    </div>
  );
};

render(<App />, document.getElementById("root"));
