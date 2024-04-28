/**
 * Search function
 */

const searchInput = document.querySelector("#searchbar > input");
const searchButton = document.querySelector("#searchbar > button");

const lookup = {
  "/": "/",
  deepl: "https://deepl.com/",
  reddit: "https://reddit.com/",
  maps: "https://maps.google.com/",
};
const engine = "startpage";
const engineUrls = {
  deepl: "https://www.deepl.com/translator#-/-/{query}",
  duckduckgo: "https://duckduckgo.com/?q={query}",
  ecosia: "https://www.ecosia.org/search?q={query}",
  google: "https://www.google.com/search?q={query}",
  startpage: "https://www.startpage.com/search?q={query}",
  youtube: "https://www.youtube.com/results?q={query}",
};

const isWebUrl = (value) => {
  try {
    const url = new URL(value);
    return url.protocol === "http:" || url.protocol === "https:";
  } catch {
    return false;
  }
};

const getTargetUrl = (value) => {
  if (isWebUrl(value)) return value;
  if (lookup[value]) return lookup[value];
  const url = engineUrls[engine] ?? engine;
  return url.replace("{query}", value);
};

const search = () => {
  const value = searchInput.value;
  const targetUrl = getTargetUrl(value);
  window.open(targetUrl, "_self");
};

searchInput.onkeyup = (event) => event.key === "Enter" && search();
searchButton.onclick = search;

/**
 * inject bookmarks into html
 */

const bookmarks = [
  {
    id: "oiWPwgv2Jm2HQyET",
    label: "Useful Github Repo",
    bookmarks: [
      {
        id: "SKk7AGb2rHZXqnPW",
        label: "Awesome",
        url: "https://github.com/sindresorhus/awesome",
      },
      {
        id: "TXVMNDBZXFcLyrom",
        label: "Awesome Search",
        url: "https://awesomelists.top/",
      },
      {
        id: "nRFdEzm5AuBodYG7",
        label: "Django Awesome",
        url: "https://github.com/wsvincent/awesome-django",
      },
    ],
  },
  {
    id: "qrqSdkKLsFfYB3WG",
    label: "Tools",
    bookmarks: [
      {
        id: "rgySW2uymgjYPrCS",
        label: "Chat Gpt",
        url: "https://chat.openai.com/",
      },
      {
        id: "2sdowbb88gjYPrCS",
        label: "Gemini",
        url: "https://gemini.google.com",
      },
    ],
  },
  {
    id: "w98vbkKLsFf9238G",
    label: "My Social Accounts",
    bookmarks: [
      {
        id: "rgySW2uymgjYPrCS",
        label: "Linkedin",
        url: "https://www.linkedin.com/in/mostafa-tehrani/",
      },
      {
        id: "nRFdEzm5AuBo28G9",
        label: "Github",
        url: "https://github.com/mooteee",
      },
    ],
  },
];

const createGroupContainer = () => {
  const container = document.createElement("div");
  container.className = "bookmark-group";
  return container;
};

const createGroupTitle = (title) => {
  const h2 = document.createElement("h2");
  h2.innerHTML = title;
  return h2;
};

const createBookmark = ({ label, url }) => {
  const li = document.createElement("li");
  const a = document.createElement("a");
  a.href = url;
  a.innerHTML = label;
  li.append(a);
  return li;
};

const createBookmarkList = (bookmarks) => {
  const ul = document.createElement("ul");
  bookmarks.map(createBookmark).forEach((li) => ul.append(li));
  return ul;
};

const createGroup = ({ label, bookmarks }) => {
  const container = createGroupContainer();
  const title = createGroupTitle(label);
  const bookmarkList = createBookmarkList(bookmarks);
  container.append(title);
  container.append(bookmarkList);
  return container;
};

const injectBookmarks = () => {
  const bookmarksContainer = document.getElementById("bookmarks");
  bookmarksContainer.append();
  bookmarks
    .map(createGroup)
    .forEach((group) => bookmarksContainer.append(group));
};

injectBookmarks();
