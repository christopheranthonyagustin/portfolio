const l = [
  { id: "GENERAL_INQUIRY", label: "General Inquiries" },
  { id: "REPORT_BUG", label: "Report Bugs" },
  { id: "NEW_REQUEST", label: "New Request" },
  { id: "ORDER_INQUIRY", label: "Order Inquiry" },
  { id: "DELIVERY_INQUIRY", label: "Delivery Inquiry" },
  { id: "OTHER", label: "Other" }
], d = 5, c = 10 * 1024 * 1024, h = 50 * 1024 * 1024, p = 20 * 1024 * 1024;
class u extends HTMLElement {
  shadow = this.attachShadow({
    mode: "open"
  });
  apiBaseUrl = "";
  // Existing LogiVis JWT
  authToken = "";
  // NEW:
  // Lark user access token obtained during Lark OAuth.
  larkUserAccessToken = "";
  currentUser = null;
  _config = {
    apiBaseUrl: "",
    channel: "LARK",
    authenticationMode: "HOST"
  };
  conversationId = crypto.randomUUID();
  initialIntent = "";
  attachments = [];
  messages = [];
  sending = !1;
  minimized = !0;
  initialized = !1;
  // ============================================================
  // Lifecycle
  // ============================================================
  connectedCallback() {
    this.initialized || (this.initialized = !0, this.apiBaseUrl = this._config.apiBaseUrl || this.getAttribute("api-base-url") || "", this.authToken = this.getAttribute("auth-token") ?? "", this.render(), this.bindEvents(), this.addWelcomeMessage(), this.updateVisibility(), console.log(
      "[UniversalChatWidget] Initialized"
    ), console.log(
      "[UniversalChatWidget] User:",
      this.currentUser
    ), console.log(
      "[UniversalChatWidget] Config:",
      this._config
    ), console.log(
      "[UniversalChatWidget] API URL:",
      this.apiBaseUrl
    ), console.log(
      "[UniversalChatWidget] Authentication:",
      {
        mode: this._config.authenticationMode,
        hasToken: !!this.authToken,
        tokenLength: this.authToken.length,
        hasLarkUserAccessToken: !!this.larkUserAccessToken,
        larkUserAccessTokenLength: this.larkUserAccessToken.length
      }
    ));
  }
  // ============================================================
  // Public Web Component API
  // ============================================================
  set user(e) {
    this.currentUser = e, console.log(
      "[UniversalChatWidget] User received:",
      e
    );
  }
  get user() {
    return this.currentUser;
  }
  set config(e) {
    console.log(
      "[UniversalChatWidget] Config received:",
      e
    ), this._config = {
      ...this._config,
      ...e
    }, this.apiBaseUrl = this._config.apiBaseUrl ?? "", console.log(
      "[UniversalChatWidget] API URL updated:",
      this.apiBaseUrl
    ), console.log(
      "[UniversalChatWidget] Authentication mode:",
      this._config.authenticationMode
    );
  }
  get config() {
    return {
      ...this._config
    };
  }
  // ============================================================
  // HOST Authentication Token
  // ============================================================
  set token(e) {
    this.authToken = e ?? "", console.log(
      "[UniversalChatWidget] HOST token received:",
      {
        hasToken: !!this.authToken,
        tokenLength: this.authToken.length
      }
    );
  }
  get token() {
    return this.authToken;
  }
  // ============================================================
  // LARK USER ACCESS TOKEN
  // ============================================================
  /**
   * Receives the Lark user_access_token from Angular.
   *
   * This is separate from the LogiVis JWT.
   */
  set larkToken(e) {
    this.larkUserAccessToken = e ?? "", console.log(
      "[UniversalChatWidget] Lark user access token received:",
      {
        hasToken: !!this.larkUserAccessToken,
        tokenLength: this.larkUserAccessToken.length
      }
    );
  }
  get larkToken() {
    return this.larkUserAccessToken;
  }
  set apiUrl(e) {
    this.apiBaseUrl = e ?? "", this._config = {
      ...this._config,
      apiBaseUrl: this.apiBaseUrl
    }, console.log(
      "[UniversalChatWidget] API URL manually updated:",
      this.apiBaseUrl
    );
  }
  get apiUrl() {
    return this.apiBaseUrl;
  }
  // ============================================================
  // Welcome
  // ============================================================
  addWelcomeMessage() {
    this.messages.push({
      role: "system",
      text: "Welcome to LogiVis Support. Please select what you need help with to get started.",
      time: this.formatTime(
        /* @__PURE__ */ new Date()
      )
    }), this.renderMessages();
  }
  // ============================================================
  // UI
  // ============================================================
  render() {
    this.shadow.innerHTML = `
      <style>

        :host {
          position: fixed;
          right: 24px;
          bottom: 24px;
          z-index: 9999;
          display: block;
          font-family: Inter, ui-sans-serif, system-ui, -apple-system,
            BlinkMacSystemFont, "Segoe UI", sans-serif;
          color: #111827;
        }

        * {
          box-sizing: border-box;
        }

        .launcher {
          width: 58px;
          height: 58px;
          border: 0;
          border-radius: 50%;
          background: #2563eb;
          color: #fff;
          cursor: pointer;
          display: grid;
          place-items: center;
          font-size: 25px;
          box-shadow: 0 8px 28px rgba(15, 23, 42, .24);
          transition: .15s ease;
        }

        .launcher:hover {
          background: #1d4ed8;
          transform: translateY(-1px);
        }

        .launcher:focus-visible,
        button:focus-visible,
        textarea:focus-visible {
          outline: 2px solid #2563eb;
          outline-offset: 2px;
        }

        .panel {
          width: min(420px, calc(100vw - 32px));
          height: min(640px, calc(100vh - 48px));
          display: flex;
          flex-direction: column;
          background: #fff;
          border: 1px solid #e5e7eb;
          border-radius: 18px;
          overflow: hidden;
          box-shadow: 0 18px 50px rgba(15, 23, 42, .22);
        }

        .hidden {
          display: none !important;
        }

        .header {
          flex: 0 0 auto;
          padding: 16px 18px;
          border-bottom: 1px solid #e5e7eb;
          background: #fff;
          display: flex;
          align-items: center;
          justify-content: space-between;
          gap: 12px;
        }

        .title {
          font-size: 16px;
          font-weight: 700;
        }

        .subtitle {
          margin-top: 3px;
          font-size: 12px;
          color: #6b7280;
        }

        .close {
          width: 34px;
          height: 34px;
          border: 0;
          border-radius: 9px;
          background: #f3f4f6;
          color: #374151;
          cursor: pointer;
          font-size: 20px;
          line-height: 1;
        }

        .messages {
          flex: 1 1 auto;
          min-height: 0;
          overflow-y: auto;
          padding: 16px;
          background: #f8fafc;
        }

        .message-row {
          display: flex;
          margin-bottom: 12px;
        }

        .message-row.user {
          justify-content: flex-end;
        }

        .bubble-wrap {
          max-width: 82%;
        }

        .bubble {
          padding: 10px 13px;
          border-radius: 14px;
          font-size: 14px;
          line-height: 1.45;
          white-space: pre-wrap;
          overflow-wrap: anywhere;
        }

        .bubble.system {
          background: #fff;
          border: 1px solid #e5e7eb;
        }

        .bubble.user {
          background: #2563eb;
          color: #fff;
        }

        .time {
          margin-top: 4px;
          font-size: 10px;
          color: #6b7280;
        }

        .message-row.user .time {
          text-align: right;
        }

        .intents {
          flex: 0 0 auto;
          padding: 11px 13px;
          border-top: 1px solid #e5e7eb;
          background: #fff;
        }

        .intent-title {
          font-size: 12px;
          color: #6b7280;
          margin-bottom: 8px;
        }

        .intent-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 7px;
        }

        .intent {
          min-height: 38px;
          border: 1px solid #cbd5e1;
          background: #fff;
          border-radius: 9px;
          padding: 8px;
          color: #111827;
          font-size: 12px;
          text-align: left;
          cursor: pointer;
        }

        .intent:hover {
          border-color: #2563eb;
          color: #2563eb;
        }

        .intent:disabled {
          cursor: default;
          opacity: .55;
        }

        .selected-intent {
          margin-top: 8px;
          font-size: 11px;
          color: #2563eb;
          font-weight: 600;
        }

        .composer {
          flex: 0 0 auto;
          padding: 10px 13px 13px;
          border-top: 1px solid #e5e7eb;
          background: #fff;
        }

        .dropzone {
          border: 1px dashed #cbd5e1;
          border-radius: 9px;
          padding: 7px 9px;
          margin-bottom: 7px;
          font-size: 11px;
          color: #6b7280;
          text-align: center;
        }

        .dropzone.active {
          border-color: #2563eb;
          background: #eff6ff;
        }

        .dropzone.disabled {
          opacity: .55;
        }

        .attachments {
          display: flex;
          flex-wrap: wrap;
          gap: 5px;
          margin-bottom: 7px;
        }

        .attachment {
          display: flex;
          align-items: center;
          gap: 5px;
          max-width: 100%;
          padding: 5px 7px;
          border: 1px solid #e5e7eb;
          border-radius: 8px;
          font-size: 11px;
          background: #f8fafc;
        }

        .attachment-name {
          max-width: 170px;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .remove {
          border: 0;
          background: transparent;
          color: #6b7280;
          padding: 0 2px;
          cursor: pointer;
          font-size: 15px;
        }

        .input-row {
          display: flex;
          gap: 7px;
          align-items: flex-end;
        }

        textarea {
          flex: 1;
          min-height: 42px;
          max-height: 120px;
          resize: vertical;
          border: 1px solid #cbd5e1;
          border-radius: 10px;
          padding: 9px 10px;
          font: inherit;
          font-size: 13px;
          outline: none;
        }

        textarea:disabled {
          background: #f1f5f9;
          cursor: not-allowed;
        }

        .icon-button {
          width: 42px;
          height: 42px;
          border-radius: 10px;
          border: 1px solid #cbd5e1;
          background: #fff;
          color: #374151;
          cursor: pointer;
          font-size: 18px;
        }

        .send-button {
          background: #2563eb;
          border-color: #2563eb;
          color: #fff;
          font-size: 19px;
        }

        .icon-button:disabled {
          opacity: .5;
          cursor: not-allowed;
        }

        .error {
          color: #b91c1c;
          font-size: 11px;
          margin-bottom: 7px;
        }

        @media (max-width: 480px) {

          :host {
            right: 12px;
            bottom: 12px;
          }

          .panel {
            width: calc(100vw - 24px);
            height: calc(100vh - 24px);
            border-radius: 16px;
          }
        }

      </style>

      <button
        class="launcher"
        id="chatLauncher"
        type="button"
        aria-label="Open LogiVis Support"
        title="Open LogiVis Support">
        💬
      </button>

      <div
        class="panel hidden"
        id="chatPanel"
        role="dialog"
        aria-label="LogiVis Support">

        <div class="header">

          <div>

            <div class="title">
              LogiVis Support
            </div>

            <div class="subtitle">
              Support and service requests
            </div>

          </div>

          <button
            class="close"
            id="closeButton"
            type="button"
            aria-label="Close chat"
            title="Close">
            ×
          </button>

        </div>

        <div
          class="messages"
          id="messages">
        </div>

        <div
          class="intents"
          id="intents">

          <div class="intent-title">
            Select an option to begin
          </div>

          <div class="intent-grid">

            ${l.map(
      (e) => `<button
                      class="intent"
                      type="button"
                      data-intent="${e.id}">
                      ${e.label}
                    </button>`
    ).join("")}

          </div>

          <div
            class="selected-intent hidden"
            id="selectedIntent">
          </div>

        </div>

        <div class="composer">

          <div
            class="error hidden"
            id="error">
          </div>

          <div
            class="dropzone disabled"
            id="dropzone">
            Select an option above to enable messages and attachments.
          </div>

          <div
            class="attachments"
            id="attachments">
          </div>

          <div class="input-row">

            <input
              class="hidden"
              id="fileInput"
              type="file"
              multiple />

            <button
              class="icon-button"
              id="attachButton"
              type="button"
              disabled
              aria-label="Attach files"
              title="Attach files">
              +
            </button>

            <textarea
              id="messageInput"
              disabled
              placeholder="Select an option first..."
              aria-label="Message">
            </textarea>

            <button
              class="icon-button send-button"
              id="sendButton"
              type="button"
              disabled
              aria-label="Send message"
              title="Send">
              ➤
            </button>

          </div>

        </div>

      </div>
    `;
  }
  // ============================================================
  // Events
  // ============================================================
  bindEvents() {
    this.getElement(
      "chatLauncher"
    ).addEventListener(
      "click",
      () => this.open()
    ), this.getElement(
      "closeButton"
    ).addEventListener(
      "click",
      () => this.close()
    ), this.shadow.querySelectorAll(".intent").forEach((n) => {
      n.addEventListener(
        "click",
        () => this.selectIntent(
          n.dataset.intent ?? ""
        )
      );
    });
    const e = this.getElement(
      "sendButton"
    ), s = this.getElement(
      "messageInput"
    ), i = this.getElement(
      "fileInput"
    ), a = this.getElement(
      "attachButton"
    ), t = this.getElement(
      "dropzone"
    );
    e.addEventListener(
      "click",
      () => {
        this.sendMessage();
      }
    ), s.addEventListener(
      "keydown",
      (n) => {
        n.key === "Enter" && !n.shiftKey && (n.preventDefault(), this.sendMessage());
      }
    ), a.addEventListener(
      "click",
      () => i.click()
    ), i.addEventListener(
      "change",
      () => {
        i.files && this.addFiles(
          Array.from(
            i.files
          )
        ), i.value = "";
      }
    ), t.addEventListener(
      "dragover",
      (n) => {
        this.initialIntent && (n.preventDefault(), t.classList.add(
          "active"
        ));
      }
    ), t.addEventListener(
      "dragleave",
      () => {
        t.classList.remove(
          "active"
        );
      }
    ), t.addEventListener(
      "drop",
      (n) => {
        this.initialIntent && (n.preventDefault(), t.classList.remove(
          "active"
        ), n.dataTransfer?.files && this.addFiles(
          Array.from(
            n.dataTransfer.files
          )
        ));
      }
    ), this.shadow.addEventListener(
      "click",
      (n) => {
        const r = n.target?.dataset.removeAttachment;
        r !== void 0 && (this.attachments.splice(
          Number(r),
          1
        ), this.renderAttachments());
      }
    );
  }
  // ============================================================
  // Open / Close
  // ============================================================
  open() {
    this.minimized = !1, this.updateVisibility(), setTimeout(() => {
      this.getElement(
        "messageInput"
      ).focus();
    });
  }
  close() {
    this.minimized = !0, this.updateVisibility();
  }
  updateVisibility() {
    const e = this.getElement(
      "chatLauncher"
    ), s = this.getElement(
      "chatPanel"
    );
    e.classList.toggle(
      "hidden",
      !this.minimized
    ), s.classList.toggle(
      "hidden",
      this.minimized
    );
  }
  // ============================================================
  // Intent
  // ============================================================
  selectIntent(e) {
    const s = l.find(
      (n) => n.id === e
    );
    if (!s || this.initialIntent)
      return;
    this.initialIntent = s.id, this.shadow.querySelectorAll(
      ".intent"
    ).forEach((n) => {
      n.disabled = !0;
    });
    const i = this.getElement(
      "selectedIntent"
    );
    i.textContent = `Selected: ${s.label}`, i.classList.remove(
      "hidden"
    );
    const a = this.getElement(
      "messageInput"
    );
    a.disabled = !1, a.placeholder = "Type your message...", this.getElement(
      "sendButton"
    ).disabled = !1, this.getElement(
      "attachButton"
    ).disabled = !1;
    const t = this.getElement(
      "dropzone"
    );
    t.classList.remove(
      "disabled"
    ), t.textContent = "Drag & drop images, videos or files here, or use + to attach.", a.focus(), this.addSystemMessage(
      `Thanks. You selected "${s.label}". How can we help?`
    ), this.dispatchEvent(
      new CustomEvent(
        "intent-selected",
        {
          detail: {
            initialIntent: this.initialIntent,
            conversationId: this.conversationId
          },
          bubbles: !0,
          composed: !0
        }
      )
    );
  }
  // ============================================================
  // Attachments
  // ============================================================
  addFiles(e) {
    this.getElement(
      "error"
    ).classList.add(
      "hidden"
    );
    for (const i of e) {
      if (this.attachments.length >= d) {
        this.showError(
          `Maximum ${d} files per message.`
        );
        break;
      }
      const a = i.type.toLowerCase(), t = a.startsWith("image/") ? c : a.startsWith("video/") ? h : p, n = a.startsWith("image/") ? "Image" : a.startsWith("video/") ? "Video" : "File";
      if (i.size > t) {
        this.showError(
          `${n} "${i.name}" exceeds the allowed size.`
        );
        continue;
      }
      this.attachments.some(
        (o) => o.fileName === i.name && o.size === i.size
      ) || this.attachments.push({
        file: i,
        fileName: i.name,
        contentType: i.type || "application/octet-stream",
        size: i.size
      });
    }
    this.renderAttachments();
  }
  renderAttachments() {
    const e = this.getElement(
      "attachments"
    );
    e.innerHTML = this.attachments.map(
      (s, i) => `<div class="attachment">

              <span
                class="attachment-name"
                title="${this.escapeHtml(
        s.fileName
      )}">
                ${this.escapeHtml(
        s.fileName
      )}
              </span>

              <button
                class="remove"
                type="button"
                data-remove-attachment="${i}"
                aria-label="Remove ${this.escapeHtml(
        s.fileName
      )}"
                title="Remove">
                ×
              </button>

            </div>`
    ).join("");
  }
  // ============================================================
  // Send Message
  // ============================================================
  async sendMessage() {
    if (this.sending)
      return;
    const e = this.getElement(
      "messageInput"
    ), s = e.value.trim();
    if (!this.initialIntent) {
      this.showError(
        "Please select an option first."
      );
      return;
    }
    if (!s && this.attachments.length === 0) {
      this.showError(
        "Please enter a message or attach a file."
      );
      return;
    }
    if (!this.currentUser) {
      this.showError(
        "Authenticated LogiVis user information is not available."
      ), console.error(
        "[UniversalChatWidget] Cannot send: currentUser is null."
      );
      return;
    }
    if (!this.apiBaseUrl) {
      this.showError(
        "Chat API URL is not configured."
      ), console.error(
        "[UniversalChatWidget] Cannot send: apiBaseUrl is empty."
      );
      return;
    }
    if (this._config.authenticationMode === "HOST" && !this.authToken) {
      this.showError(
        "Authentication token is missing."
      ), console.error(
        "[UniversalChatWidget] Cannot send: HOST token is missing."
      );
      return;
    }
    if (this._config.channel === "LARK" && !this.larkUserAccessToken) {
      this.showError(
        "Lark user authentication token is missing."
      ), console.error(
        "[UniversalChatWidget] Cannot send: Lark user access token is missing."
      );
      return;
    }
    console.log(
      "================================================"
    ), console.log(
      "[UniversalChatWidget] Preparing chat request"
    ), console.log(
      "[UniversalChatWidget] API URL:",
      this.buildMessagesUrl()
    ), console.log(
      "[UniversalChatWidget] Authentication:",
      {
        mode: this._config.authenticationMode,
        hasToken: !!this.authToken,
        tokenLength: this.authToken.length,
        hasLarkUserAccessToken: !!this.larkUserAccessToken,
        larkUserAccessTokenLength: this.larkUserAccessToken.length
      }
    ), console.log(
      "[UniversalChatWidget] User:",
      this.currentUser
    ), console.log(
      "[UniversalChatWidget] Channel:",
      this._config.channel
    ), console.log(
      "================================================"
    ), this.sending = !0, this.setComposerEnabled(
      !1
    ), this.clearError();
    const i = s || this.attachments.map(
      (t) => `[${t.fileName}]`
    ).join(" ");
    this.addUserMessage(
      i
    );
    const a = {
      userId: this.currentUser.id,
      providerUserId: this.currentUser.providerUserId,
      senderName: this.currentUser.name,
      ...this.currentUser.email ? {
        senderEmail: this.currentUser.email
      } : {},
      conversationId: this.conversationId,
      initialIntent: this.initialIntent,
      message: s,
      attachments: this.attachments.map(
        (t) => ({
          fileName: t.fileName,
          contentType: t.contentType,
          size: t.size
        })
      ),
      channel: this._config.channel ?? "LARK",
      // NEW:
      // Pass the Lark user access token to logivis-worker.
      userAccessToken: this.larkUserAccessToken
    };
    console.log(
      "[UniversalChatWidget] Sending message:",
      {
        url: this.buildMessagesUrl(),
        requestBody: {
          ...a,
          // Never print the actual token.
          userAccessToken: this.larkUserAccessToken ? "<token-present>" : "MISSING"
        },
        authorizationHeader: this.authToken ? "Bearer <token-present>" : "MISSING"
      }
    );
    try {
      const t = await fetch(
        this.buildMessagesUrl(),
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            ...this.authToken ? {
              Authorization: `Bearer ${this.authToken}`
            } : {}
          },
          body: JSON.stringify(
            a
          )
        }
      );
      console.log(
        "[UniversalChatWidget] Chat API response:",
        {
          status: t.status,
          statusText: t.statusText,
          ok: t.ok
        }
      );
      const n = t.headers.get(
        "content-type"
      ) ?? "";
      let o = {};
      if (n.includes(
        "application/json"
      ) ? o = await t.json() : o = {
        success: !1,
        error: await t.text() || `Chat API failed (${t.status}).`
      }, console.log(
        "[UniversalChatWidget] Chat API result:",
        o
      ), !t.ok || !o.success)
        throw new Error(
          o.error ?? o.message ?? `Chat API failed (${t.status}).`
        );
      this.addSystemMessage(
        "Your message was sent successfully."
      ), this.attachments = [], this.renderAttachments(), e.value = "", this.dispatchEvent(
        new CustomEvent(
          "message-sent",
          {
            detail: {
              response: o,
              conversationId: this.conversationId,
              initialIntent: this.initialIntent
            },
            bubbles: !0,
            composed: !0
          }
        )
      );
    } catch (t) {
      console.error(
        "[UniversalChatWidget] Send failed:",
        t
      ), this.showError(
        t instanceof Error ? t.message : "Unable to send message."
      ), this.addSystemMessage(
        "I couldn't send that message. Please try again."
      );
    } finally {
      this.sending = !1, this.setComposerEnabled(
        !0
      );
    }
  }
  // ============================================================
  // API
  // ============================================================
  buildMessagesUrl() {
    return `${this.apiBaseUrl.replace(
      /\/$/,
      ""
    )}/chat/messages`;
  }
  // ============================================================
  // Composer
  // ============================================================
  setComposerEnabled(e) {
    const s = this.getElement(
      "messageInput"
    ), i = this.getElement(
      "sendButton"
    ), a = this.getElement(
      "attachButton"
    );
    s.disabled = !e || !this.initialIntent, i.disabled = !e || !this.initialIntent, a.disabled = !e || !this.initialIntent;
  }
  // ============================================================
  // Messages
  // ============================================================
  addUserMessage(e) {
    this.messages.push({
      role: "user",
      text: e,
      time: this.formatTime(
        /* @__PURE__ */ new Date()
      )
    }), this.renderMessages();
  }
  addSystemMessage(e) {
    this.messages.push({
      role: "system",
      text: e,
      time: this.formatTime(
        /* @__PURE__ */ new Date()
      )
    }), this.renderMessages();
  }
  renderMessages() {
    const e = this.shadow.querySelector(
      "#messages"
    );
    e && (e.innerHTML = this.messages.map(
      (s) => `
            <div
              class="message-row ${s.role === "user" ? "user" : "system"}">

              <div class="bubble-wrap">

                <div
                  class="bubble ${s.role === "user" ? "user" : "system"}">

                  ${this.escapeHtml(
        s.text
      )}

                </div>

                <div class="time">
                  ${this.escapeHtml(
        s.time
      )}
                </div>

              </div>

            </div>
          `
    ).join(""), e.scrollTop = e.scrollHeight);
  }
  // ============================================================
  // Errors
  // ============================================================
  showError(e) {
    const s = this.getElement(
      "error"
    );
    s.textContent = e, s.classList.remove(
      "hidden"
    );
  }
  clearError() {
    const e = this.getElement(
      "error"
    );
    e.textContent = "", e.classList.add(
      "hidden"
    );
  }
  // ============================================================
  // Utilities
  // ============================================================
  getElement(e) {
    const s = this.shadow.querySelector(
      `#${e}`
    );
    if (!s)
      throw new Error(
        `Chat widget element not found: ${e}`
      );
    return s;
  }
  formatTime(e) {
    return e.toLocaleTimeString(
      [],
      {
        hour: "2-digit",
        minute: "2-digit"
      }
    );
  }
  escapeHtml(e) {
    return e.replaceAll(
      "&",
      "&amp;"
    ).replaceAll(
      "<",
      "&lt;"
    ).replaceAll(
      ">",
      "&gt;"
    ).replaceAll(
      '"',
      "&quot;"
    ).replaceAll(
      "'",
      "&#039;"
    );
  }
}
customElements.get(
  "universal-chat-widget"
) || customElements.define(
  "universal-chat-widget",
  u
);
export {
  u as UniversalChatWidget
};
//# sourceMappingURL=universal-chat-widget.js.map
