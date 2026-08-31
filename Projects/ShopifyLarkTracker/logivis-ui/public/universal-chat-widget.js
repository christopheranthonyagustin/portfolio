const c = [
  { id: "GENERAL_INQUIRY", label: "General Inquiries" },
  { id: "REPORT_BUG", label: "Report Bugs" },
  { id: "NEW_REQUEST", label: "New Request" },
  { id: "ORDER_INQUIRY", label: "Order Inquiry" },
  { id: "DELIVERY_INQUIRY", label: "Delivery Inquiry" },
  { id: "OTHER", label: "Other" }
], h = 5, p = 10 * 1024 * 1024, u = 50 * 1024 * 1024, g = 20 * 1024 * 1024, m = 20 * 1024 * 1024;
class f extends HTMLElement {
  shadow = this.attachShadow({ mode: "open" });
  apiBaseUrl = "";
  authToken = "";
  larkUserAccessToken = "";
  larkRefreshTokenValue = "";
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
  maximized = !1;
  initialized = !1;
  connectedCallback() {
    this.initialized || (this.initialized = !0, this.apiBaseUrl = this._config.apiBaseUrl || this.getAttribute("api-base-url") || "", this.authToken = this.getAttribute("auth-token") ?? "", this.larkRefreshTokenValue = this.getAttribute("lark-refresh-token") ?? "", this.restoreConversation(), this.initializeRefreshTokenReadiness(), this.render(), this.bindEvents(), this.addWelcomeMessage(), this.updateVisibility(), this.loadConversationHistory(), console.log("[UniversalChatWidget] Initialized"), console.log("[UniversalChatWidget] User:", this.currentUser), console.log("[UniversalChatWidget] Config:", this._config), console.log("[UniversalChatWidget] API URL:", this.apiBaseUrl), console.log("[UniversalChatWidget] Authentication:", {
      mode: this._config.authenticationMode,
      hasToken: !!this.authToken,
      tokenLength: this.authToken.length,
      hasLarkUserAccessToken: !!this.larkUserAccessToken,
      larkUserAccessTokenLength: this.larkUserAccessToken.length
    }));
  }
  set user(e) {
    this.currentUser = e, console.log("[UniversalChatWidget] User received:", e);
  }
  get user() {
    return this.currentUser;
  }
  set config(e) {
    this._config = { ...this._config, ...e }, this.apiBaseUrl = this._config.apiBaseUrl ?? "", console.log("[UniversalChatWidget] Config received:", e), console.log("[UniversalChatWidget] API URL updated:", this.apiBaseUrl), console.log("[UniversalChatWidget] Authentication mode:", this._config.authenticationMode);
  }
  get config() {
    return { ...this._config };
  }
  set token(e) {
    this.authToken = e ?? "", console.log("[UniversalChatWidget] HOST token received:", {
      hasToken: !!this.authToken,
      tokenLength: this.authToken.length
    });
  }
  get token() {
    return this.authToken;
  }
  set larkToken(e) {
    this.larkUserAccessToken = e ?? "", console.log("[UniversalChatWidget] Lark user access token received:", {
      hasToken: !!this.larkUserAccessToken,
      tokenLength: this.larkUserAccessToken.length
    });
  }
  get larkToken() {
    return this.larkUserAccessToken;
  }
  set larkRefreshToken(e) {
    this.larkRefreshTokenValue = e ?? "", this.initializeRefreshTokenReadiness();
  }
  get larkRefreshToken() {
    return this.larkRefreshTokenValue;
  }
  set apiUrl(e) {
    this.apiBaseUrl = e ?? "", this._config = { ...this._config, apiBaseUrl: this.apiBaseUrl };
  }
  get apiUrl() {
    return this.apiBaseUrl;
  }
  render() {
    this.shadow.innerHTML = `
      <style>
        :host {
          position: fixed;
          right: 24px;
          bottom: 24px;
          z-index: 9999;
          display: block;
          font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
          color: #111827;
        }
        * { box-sizing: border-box; }
        button, textarea, input { font: inherit; }
        .hidden { display: none !important; }

        .launcher {
          width: 58px; height: 58px; border: 0; border-radius: 50%;
          background: #2563eb; color: #fff; cursor: pointer;
          display: grid; place-items: center; font-size: 25px;
          box-shadow: 0 8px 28px rgba(15, 23, 42, .24);
        }
        .launcher:hover { background: #1d4ed8; }

        .panel {
          width: min(420px, calc(100vw - 32px));
          height: min(640px, calc(100vh - 48px));
          display: flex; flex-direction: column;
          background: #fff; border: 1px solid #e5e7eb;
          border-radius: 18px; overflow: hidden;
          box-shadow: 0 18px 50px rgba(15, 23, 42, .22);
        }
        .panel.maximized {
          position: fixed; inset: 12px; width: auto; height: auto;
          max-width: none; max-height: none; border-radius: 14px;
        }

        .header {
          flex: 0 0 auto; padding: 14px 16px; border-bottom: 1px solid #e5e7eb;
          background: #fff; display: flex; align-items: center; gap: 12px;
        }
        .header-info { flex: 1; min-width: 0; }
        .title { font-size: 16px; font-weight: 700; }
        .subtitle { margin-top: 3px; font-size: 12px; color: #6b7280; }
        .header-actions { display: flex; gap: 6px; }
        .header-button {
          width: 34px; height: 34px; border: 0; border-radius: 9px;
          background: #f3f4f6; color: #374151; cursor: pointer;
          display: grid; place-items: center; font-size: 16px;
        }
        .header-button:hover { background: #e5e7eb; }

        .messages {
          flex: 1 1 auto; min-height: 0; overflow-y: auto;
          padding: 16px; background: #f8fafc;
        }
        .message-row { display: flex; margin-bottom: 12px; }
        .message-row.user { justify-content: flex-end; }
        .message-row.inbound { justify-content: flex-start; }
        .bubble-wrap { max-width: 82%; }
        .bubble {
          padding: 10px 13px; border-radius: 14px; font-size: 14px;
          line-height: 1.45; white-space: pre-wrap; overflow-wrap: anywhere;
        }
        .bubble.system { background: #fff; border: 1px solid #e5e7eb; }
        .bubble.user { background: #2563eb; color: #fff; }
        .bubble.inbound { background: #fff; border: 1px solid #e5e7eb; }
        .sender { margin-bottom: 4px; font-size: 11px; font-weight: 600; color: #475569; }
        .time { margin-top: 4px; font-size: 10px; color: #6b7280; }
        .message-row.user .time { text-align: right; }
        .message-attachments { margin-top: 7px; display: flex; flex-wrap: wrap; gap: 6px; }
        .message-attachment { max-width: 180px; border-radius: 9px; overflow: hidden; background: rgba(255,255,255,.18); }
        .message-attachment img, .message-attachment video { display: block; max-width: 180px; max-height: 130px; object-fit: cover; }
        .message-attachment-name { padding: 5px 7px; font-size: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

        .intents {
          flex: 0 0 auto; padding: 11px 13px; border-top: 1px solid #e5e7eb; background: #fff;
        }
        .intent-title { font-size: 12px; color: #6b7280; margin-bottom: 8px; }
        .intent-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 7px; }
        .intent {
          min-height: 38px; border: 1px solid #cbd5e1; background: #fff;
          border-radius: 9px; padding: 8px; color: #111827; font-size: 12px;
          text-align: left; cursor: pointer;
        }
        .intent:hover { border-color: #2563eb; color: #2563eb; }
        .intent:disabled { cursor: default; opacity: .55; }
        .selected-intent { margin-top: 8px; font-size: 11px; color: #2563eb; font-weight: 600; }

        .composer {
          flex: 0 0 auto; padding: 10px 13px 13px;
          border-top: 1px solid #e5e7eb; background: #fff;
        }
        .error { color: #b91c1c; font-size: 11px; margin-bottom: 7px; }
        .dropzone {
          border: 1px dashed #cbd5e1; border-radius: 9px; padding: 7px 9px;
          margin-bottom: 7px; font-size: 11px; color: #6b7280; text-align: center;
        }
        .dropzone.active { border-color: #2563eb; background: #eff6ff; }
        .dropzone.disabled { opacity: .55; }
        .attachments { display: flex; flex-wrap: wrap; gap: 6px; margin-bottom: 7px; }
        .attachment {
          display: flex; align-items: center; gap: 6px; max-width: 100%;
          padding: 5px 7px; border: 1px solid #e5e7eb; border-radius: 8px;
          font-size: 11px; background: #f8fafc;
        }
        .attachment-preview { width: 30px; height: 30px; object-fit: cover; border-radius: 5px; flex: 0 0 auto; }
        .attachment-icon { width: 30px; height: 30px; display: grid; place-items: center; background: #e5e7eb; border-radius: 5px; flex: 0 0 auto; }
        .attachment-name { max-width: 160px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
        .attachment-size { color: #6b7280; font-size: 9px; }
        .attachment-status { color: #64748b; font-size: 9px; }
        .remove { border: 0; background: transparent; color: #6b7280; padding: 0 2px; cursor: pointer; font-size: 15px; }
        .input-row { display: flex; gap: 7px; align-items: flex-end; }
        textarea {
          flex: 1; min-height: 42px; max-height: 120px; resize: vertical;
          border: 1px solid #cbd5e1; border-radius: 10px;
          padding: 9px 10px; margin: 0; font: inherit; font-size: 13px;
          line-height: 1.35; outline: none; display: block;
        }
        textarea::placeholder { color: #94a3b8; }
        textarea:disabled { background: #f1f5f9; cursor: not-allowed; }
        .icon-button {
          width: 42px; height: 42px; border-radius: 10px; border: 1px solid #cbd5e1;
          background: #fff; color: #374151; cursor: pointer; font-size: 18px;
          flex: 0 0 auto;
        }
        .send-button { background: #2563eb; border-color: #2563eb; color: #fff; font-size: 19px; }
        .icon-button:disabled { opacity: .5; cursor: not-allowed; }
        button:focus-visible, textarea:focus-visible { outline: 2px solid #2563eb; outline-offset: 2px; }

        @media (max-width: 480px) {
          :host { right: 12px; bottom: 12px; }
          .panel { width: calc(100vw - 24px); height: calc(100vh - 24px); border-radius: 16px; }
          .panel.maximized { inset: 6px; border-radius: 12px; }
          .bubble-wrap { max-width: 90%; }
        }
      </style>

      <button class="launcher" id="chatLauncher" type="button" aria-label="Open LogiVis Support" title="Open LogiVis Support">💬</button>

      <div class="panel hidden" id="chatPanel" role="dialog" aria-label="LogiVis Support">
        <div class="header">
          <div class="header-info">
            <div class="title">LogiVis Support</div>
            <div class="subtitle">Support and service requests</div>
          </div>
          <div class="header-actions">
            <button class="header-button" id="maximizeButton" type="button" aria-label="Maximize chat" title="Maximize">⛶</button>
            <button class="header-button" id="closeButton" type="button" aria-label="Close chat" title="Close">×</button>
          </div>
        </div>

        <div class="messages" id="messages"></div>

        <div class="intents" id="intents">
          <div class="intent-title">Select an option to begin</div>
          <div class="intent-grid">
            ${c.map((e) => `<button class="intent" type="button" data-intent="${e.id}">${e.label}</button>`).join("")}
          </div>
          <div class="selected-intent hidden" id="selectedIntent"></div>
        </div>

        <div class="composer">
          <div class="error hidden" id="error"></div>
          <div class="dropzone disabled" id="dropzone">Select an option above to enable messages and attachments.</div>
          <div class="attachments" id="attachments"></div>
          <div class="input-row">
            <input class="hidden" id="fileInput" type="file" multiple accept="image/*,video/*,audio/*,.pdf,.doc,.docx,.xls,.xlsx,.csv,.txt,.zip,.rar" />
            <button class="icon-button" id="attachButton" type="button" disabled aria-label="Attach files" title="Attach images, audio, video or files">+</button>
            <textarea id="messageInput" disabled placeholder="Select an option first..." aria-label="Message"></textarea>
            <button class="icon-button send-button" id="sendButton" type="button" disabled aria-label="Send message" title="Send">➤</button>
          </div>
        </div>
      </div>
    `;
  }
  bindEvents() {
    this.getElement("chatLauncher").addEventListener("click", () => this.open()), this.getElement("closeButton").addEventListener("click", () => this.close()), this.getElement("maximizeButton").addEventListener("click", () => this.toggleMaximize()), this.shadow.querySelectorAll(".intent").forEach((i) => {
      i.addEventListener("click", () => this.selectIntent(i.dataset.intent ?? ""));
    });
    const e = this.getElement("sendButton"), t = this.getElement("messageInput"), s = this.getElement("fileInput"), n = this.getElement("attachButton"), r = this.getElement("dropzone");
    e.addEventListener("click", () => {
      this.sendMessage();
    }), t.addEventListener("keydown", (i) => {
      i.key === "Enter" && !i.shiftKey && (i.preventDefault(), this.sendMessage());
    }), n.addEventListener("click", () => s.click()), s.addEventListener("change", () => {
      s.files && this.addFiles(Array.from(s.files)), s.value = "";
    }), r.addEventListener("dragover", (i) => {
      this.initialIntent && (i.preventDefault(), r.classList.add("active"));
    }), r.addEventListener("dragleave", () => r.classList.remove("active")), r.addEventListener("drop", (i) => {
      this.initialIntent && (i.preventDefault(), r.classList.remove("active"), i.dataTransfer?.files && this.addFiles(Array.from(i.dataTransfer.files)));
    }), this.shadow.addEventListener("click", (i) => {
      const o = i.target?.dataset.removeAttachment;
      if (o !== void 0) {
        const a = this.attachments.splice(Number(o), 1)[0];
        a?.previewUrl && URL.revokeObjectURL(a.previewUrl), this.renderAttachments();
      }
    });
  }
  open() {
    this.minimized = !1, this.updateVisibility(), setTimeout(() => this.getElement("messageInput").focus());
  }
  close() {
    this.minimized = !0, this.maximized = !1, this.updateVisibility();
  }
  toggleMaximize() {
    this.maximized = !this.maximized;
    const e = this.getElement("chatPanel"), t = this.getElement("maximizeButton");
    e.classList.toggle("maximized", this.maximized), t.textContent = this.maximized ? "↙" : "⛶", t.title = this.maximized ? "Restore" : "Maximize", t.setAttribute("aria-label", this.maximized ? "Restore chat" : "Maximize chat");
  }
  updateVisibility() {
    const e = this.getElement("chatLauncher"), t = this.getElement("chatPanel");
    e.classList.toggle("hidden", !this.minimized), t.classList.toggle("hidden", this.minimized), t.classList.toggle("maximized", this.maximized && !this.minimized);
  }
  selectIntent(e) {
    const t = c.find((i) => i.id === e);
    if (!t || this.initialIntent) return;
    this.initialIntent = t.id, this.persistConversation(), this.shadow.querySelectorAll(".intent").forEach((i) => i.disabled = !0);
    const s = this.getElement("selectedIntent");
    s.textContent = `Selected: ${t.label}`, s.classList.remove("hidden");
    const n = this.getElement("messageInput");
    n.disabled = !1, n.placeholder = "Type your message...", this.getElement("sendButton").disabled = !1, this.getElement("attachButton").disabled = !1;
    const r = this.getElement("dropzone");
    r.classList.remove("disabled"), r.textContent = "Drag & drop images, audio, videos or files here, or use + to attach.", n.focus(), this.addSystemMessage(`Thanks. You selected "${t.label}". How can we help?`), this.dispatchEvent(new CustomEvent("intent-selected", {
      detail: { initialIntent: this.initialIntent, conversationId: this.conversationId },
      bubbles: !0,
      composed: !0
    }));
  }
  addFiles(e) {
    this.clearError();
    for (const t of e) {
      if (this.attachments.length >= h) {
        this.showError(`Maximum ${h} files per message.`);
        break;
      }
      const s = t.type.toLowerCase(), n = s.startsWith("image/") ? p : s.startsWith("video/") ? u : s.startsWith("audio/") ? g : m, r = s.startsWith("image/") ? "Image" : s.startsWith("video/") ? "Video" : s.startsWith("audio/") ? "Audio" : "File";
      if (t.size > n) {
        this.showError(`${r} "${t.name}" exceeds the allowed size.`);
        continue;
      }
      this.attachments.some((i) => i.fileName === t.name && i.size === t.size) || this.attachments.push({
        file: t,
        fileName: t.name,
        contentType: t.type || "application/octet-stream",
        size: t.size,
        status: "ready",
        previewUrl: s.startsWith("image/") || s.startsWith("video/") ? URL.createObjectURL(t) : void 0
      });
    }
    this.renderAttachments(), this.prepareAttachments();
  }
  renderAttachments() {
    const e = this.getElement("attachments");
    e.innerHTML = this.attachments.map((t, s) => {
      const n = t.contentType.toLowerCase();
      return `<div class="attachment">
        ${n.startsWith("image/") && t.previewUrl ? `<img class="attachment-preview" src="${t.previewUrl}" alt="">` : n.startsWith("video/") && t.previewUrl ? '<span class="attachment-icon">🎬</span>' : n.startsWith("audio/") ? '<span class="attachment-icon">🎵</span>' : '<span class="attachment-icon">📎</span>'}
        <div>
          <div class="attachment-name" title="${this.escapeHtml(t.fileName)}">${this.escapeHtml(t.fileName)}</div>
          <div class="attachment-size">${this.formatBytes(t.size)}</div>
          <div class="attachment-status">${this.escapeHtml(t.status ?? "ready")}</div>
        </div>
        <button class="remove" type="button" data-remove-attachment="${s}" aria-label="Remove ${this.escapeHtml(t.fileName)}" title="Remove">×</button>
      </div>`;
    }).join("");
  }
  async fileToDataUrl(e) {
    return await new Promise((t, s) => {
      const n = new FileReader();
      n.onload = () => t(String(n.result)), n.onerror = () => s(n.error ?? new Error("Unable to read attachment.")), n.readAsDataURL(e);
    });
  }
  async sendMessage() {
    if (this.sending) return;
    const e = this.getElement("messageInput"), t = e.value.trim();
    if (!this.initialIntent) return this.showError("Please select an option first.");
    if (!t && this.attachments.length === 0) return this.showError("Please enter a message or attach a file.");
    if (!this.currentUser) return this.showError("Authenticated LogiVis user information is not available.");
    if (!this.apiBaseUrl) return this.showError("Chat API URL is not configured.");
    if (this._config.authenticationMode === "HOST" && !this.authToken)
      return this.showError("Authentication token is missing.");
    if (this._config.channel === "LARK" && !this.larkUserAccessToken)
      return this.showError("Lark user authentication token is missing.");
    this.sending = !0, this.setComposerEnabled(!1), this.clearError();
    try {
      this.setAttachmentStatus("uploading");
      const s = [];
      for (const a of this.attachments)
        s.push({
          fileName: a.fileName,
          contentType: a.contentType,
          size: a.size,
          contentBase64: await this.fileToDataUrl(a.file)
        });
      const n = t || this.attachments.map((a) => `[${a.fileName}]`).join(" ");
      this.addUserMessage(n, this.attachments);
      const r = {
        userId: this.currentUser.id,
        providerUserId: this.currentUser.providerUserId,
        senderName: this.currentUser.name,
        ...this.currentUser.email ? { senderEmail: this.currentUser.email } : {},
        conversationId: this.conversationId,
        initialIntent: this.initialIntent,
        message: t,
        attachments: s,
        channel: this._config.channel ?? "LARK",
        userAccessToken: this.larkUserAccessToken
      };
      this.captureMessageForBackend({
        direction: "OUTBOUND",
        conversationId: this.conversationId,
        senderId: this.currentUser.id,
        senderName: this.currentUser.name,
        messageType: this.getMessageType(t, this.attachments),
        text: t,
        createdAt: (/* @__PURE__ */ new Date()).toISOString(),
        attachments: this.attachments.map((a) => ({
          fileName: a.fileName,
          contentType: a.contentType,
          size: a.size
        }))
      }), console.log("[UniversalChatWidget] Sending message:", {
        url: this.buildMessagesUrl(),
        requestBody: {
          ...r,
          userAccessToken: this.larkUserAccessToken ? "<token-present>" : "MISSING",
          attachments: s.map((a) => ({
            fileName: a.fileName,
            contentType: a.contentType,
            size: a.size,
            hasContent: !!a.contentBase64,
            encodedLength: a.contentBase64.length
          }))
        },
        authorizationHeader: this.authToken ? "Bearer <token-present>" : "MISSING"
      });
      const i = await fetch(this.buildMessagesUrl(), {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...this.authToken ? { Authorization: `Bearer ${this.authToken}` } : {}
        },
        body: JSON.stringify(r)
      }), d = i.headers.get("content-type") ?? "";
      let o = {};
      if (d.includes("application/json") ? o = await i.json() : o = { success: !1, error: await i.text() || `Chat API failed (${i.status}).` }, !i.ok || !o.success)
        throw new Error(o.error ?? o.message ?? `Chat API failed (${i.status}).`);
      o.conversationId && o.conversationId !== this.conversationId && (this.conversationId = o.conversationId, this.persistConversation()), o.reply && this.handleInboundMessage(o.reply), o.messages?.length && o.messages.forEach((a) => this.handleInboundMessage(a)), this.addSystemMessage("Your message was sent successfully."), this.setAttachmentStatus("success"), this.clearAttachments(), e.value = "", this.dispatchEvent(new CustomEvent("message-sent", {
        detail: { response: o, conversationId: this.conversationId, initialIntent: this.initialIntent },
        bubbles: !0,
        composed: !0
      }));
    } catch (s) {
      this.setAttachmentStatus("failed"), console.error("[UniversalChatWidget] Send failed:", s), this.showError(s instanceof Error ? s.message : "Unable to send message."), this.addSystemMessage("I couldn't send that message. Please try again.");
    } finally {
      this.sending = !1, this.setComposerEnabled(!0);
    }
  }
  clearAttachments() {
    for (const e of this.attachments)
      e.previewUrl && URL.revokeObjectURL(e.previewUrl);
    this.attachments = [], this.renderAttachments();
  }
  buildMessagesUrl() {
    return `${this.apiBaseUrl.replace(/\/$/, "")}/chat/messages`;
  }
  setComposerEnabled(e) {
    const t = this.getElement("messageInput"), s = this.getElement("sendButton"), n = this.getElement("attachButton");
    t.disabled = !e || !this.initialIntent, s.disabled = !e || !this.initialIntent, n.disabled = !e || !this.initialIntent;
  }
  addUserMessage(e, t = []) {
    this.messages.push({
      conversationId: this.conversationId,
      senderId: this.currentUser?.id,
      senderName: this.currentUser?.name,
      messageType: this.getMessageType(e, t),
      text: e,
      direction: "OUTBOUND",
      createdAt: (/* @__PURE__ */ new Date()).toISOString(),
      attachments: t.map((s) => ({
        fileName: s.fileName,
        contentType: s.contentType,
        size: s.size
      }))
    }), this.renderMessages(), this.persistConversation();
  }
  addSystemMessage(e) {
    this.messages.push({
      conversationId: this.conversationId,
      messageType: "text",
      text: e,
      direction: "SYSTEM",
      createdAt: (/* @__PURE__ */ new Date()).toISOString()
    }), this.renderMessages();
  }
  addWelcomeMessage() {
    this.addSystemMessage("Welcome to LogiVis Support. Please select what you need help with to get started.");
  }
  renderMessages() {
    const e = this.shadow.querySelector("#messages");
    e && (e.innerHTML = this.messages.map((t) => {
      const s = t.direction === "OUTBOUND", n = t.direction === "INBOUND", r = s ? "user" : n ? "inbound" : "system", i = s ? "user" : n ? "inbound" : "system", d = n && t.senderName ? `<div class="sender">${this.escapeHtml(t.senderName)}</div>` : "", o = t.attachments?.length ? `<div class="message-attachments">${t.attachments.map((a) => {
        const l = a.contentType.toLowerCase();
        return `<div class="message-attachment"><div class="message-attachment-name">${l.startsWith("image/") ? "🖼️" : l.startsWith("video/") ? "🎬" : l.startsWith("audio/") ? "🎵" : "📎"} ${this.escapeHtml(a.fileName)}</div></div>`;
      }).join("")}</div>` : "";
      return `<div class="message-row ${r}">
        <div class="bubble-wrap">
          ${d}
          <div class="bubble ${i}">${this.escapeHtml(t.text)}${o}</div>
          <div class="time">${this.escapeHtml(this.formatMessageTime(t.createdAt))}</div>
        </div>
      </div>`;
    }).join(""), e.scrollTop = e.scrollHeight);
  }
  /*
   * PHASE 1 — WIDGET FIRST
   * Read/store refresh_token if supplied.
   * Only presence and length are logged.
   * Actual token refresh is Backend Phase.
   */
  initializeRefreshTokenReadiness() {
    console.log("[UniversalChatWidget] Lark refresh token readiness:", {
      available: !!this.larkRefreshTokenValue,
      length: this.larkRefreshTokenValue.length
    });
  }
  /*
   * Persist the active conversation so browser refresh can restore it.
   * Message persistence is intentionally not implemented here; history belongs
   * to the backend API.
   */
  persistConversation() {
    const e = this.getConversationStorageKey();
    try {
      localStorage.setItem(e, JSON.stringify({
        conversationId: this.conversationId,
        initialIntent: this.initialIntent,
        updatedAt: (/* @__PURE__ */ new Date()).toISOString()
      })), console.log("[UniversalChatWidget] Conversation persisted:", {
        conversationId: this.conversationId,
        storageKey: e
      });
    } catch (t) {
      console.warn("[UniversalChatWidget] Conversation persistence unavailable:", t);
    }
  }
  /*
   * Restore conversationId after browser refresh.
   * Backend history loading is intentionally separate.
   */
  restoreConversation() {
    const e = this.getConversationStorageKey();
    try {
      const t = localStorage.getItem(e);
      if (!t) {
        console.log("[UniversalChatWidget] No persisted conversation found.");
        return;
      }
      const s = JSON.parse(t);
      s.conversationId && (this.conversationId = s.conversationId), s.initialIntent && (this.initialIntent = s.initialIntent), console.log("[UniversalChatWidget] Conversation restored:", {
        conversationId: this.conversationId,
        hasInitialIntent: !!this.initialIntent
      });
    } catch (t) {
      console.warn("[UniversalChatWidget] Unable to restore conversation:", t);
    }
  }
  /*
   * Phase 1 readiness function.
   * Backend chat-history API is implemented later.
   */
  loadConversationHistory() {
    console.log("[UniversalChatWidget] loadConversationHistory() called:", {
      conversationId: this.conversationId,
      userId: this.currentUser?.id ?? "NOT_AVAILABLE",
      providerUserId: this.currentUser?.providerUserId ?? "NOT_AVAILABLE"
    }), console.log("[UniversalChatWidget] Chat history API implementation deferred to Backend Phase.");
  }
  /*
   * Prepare the widget-side attachment contract.
   * Actual Drive storage remains a backend responsibility.
   */
  prepareAttachments() {
    console.log("[UniversalChatWidget] prepareAttachments():", {
      count: this.attachments.length,
      attachments: this.attachments.map((e) => ({
        fileName: e.fileName,
        contentType: e.contentType,
        size: e.size,
        hasActualFileData: !!e.file
      }))
    });
  }
  /*
   * Phase 1 readiness for Google capture.
   * Actual Google Drive / Sheets operations remain backend responsibilities.
   */
  captureMessageForBackend(e) {
    console.log("[UniversalChatWidget] captureMessageForBackend() readiness:", {
      conversationId: e.conversationId,
      direction: e.direction,
      messageType: e.messageType,
      senderName: e.senderName,
      attachmentCount: e.attachments?.length ?? 0
    }), console.log("[UniversalChatWidget] Google Drive / Sheets capture deferred to Backend Phase.");
  }
  /*
   * Handle a message originating outside the widget, especially Lark.
   * Backend delivery can call this through the response/event adapter later.
   */
  handleInboundMessage(e) {
    if (console.log("[UniversalChatWidget] Inbound message received:", {
      conversationId: e.conversationId,
      senderId: e.senderId,
      senderName: e.senderName,
      direction: e.direction,
      messageType: e.messageType,
      createdAt: e.createdAt,
      attachmentCount: e.attachments?.length ?? 0
    }), e.direction !== "INBOUND") {
      console.warn("[UniversalChatWidget] Ignoring non-inbound message in inbound handler.");
      return;
    }
    if (e.conversationId !== this.conversationId) {
      console.warn("[UniversalChatWidget] Inbound message belongs to another conversation:", {
        activeConversationId: this.conversationId,
        messageConversationId: e.conversationId
      });
      return;
    }
    this.addInboundMessage(e);
  }
  addInboundMessage(e) {
    this.messages.push({
      ...e,
      direction: "INBOUND",
      conversationId: this.conversationId
    }), this.renderMessages(), this.persistConversation(), this.captureMessageForBackend(e), this.dispatchEvent(new CustomEvent("message-received", {
      detail: {
        message: e,
        conversationId: this.conversationId
      },
      bubbles: !0,
      composed: !0
    }));
  }
  /*
   * Phase 1 contract checkpoint.
   * The actual API contract is frozen after readiness validation.
   */
  freezeRequestContract() {
    console.log("[UniversalChatWidget] Request/response contract freeze checkpoint:", {
      version: "Phase-1",
      conversationId: this.conversationId,
      fields: [
        "userId",
        "providerUserId",
        "senderName",
        "senderEmail",
        "conversationId",
        "initialIntent",
        "message",
        "attachments",
        "channel",
        "userAccessToken"
      ],
      responseReadiness: [
        "success",
        "message",
        "error",
        "conversationId",
        "reply",
        "messages"
      ]
    }), console.log("[UniversalChatWidget] Contract is ready for Backend Phase implementation.");
  }
  setAttachmentStatus(e) {
    this.attachments.forEach((t) => t.status = e), this.renderAttachments();
  }
  getMessageType(e, t) {
    if (t.length === 0) return "text";
    const s = t[0].contentType.toLowerCase();
    return s.startsWith("image/") ? "image" : s.startsWith("audio/") ? "audio" : s.startsWith("video/") ? "video" : "file";
  }
  getConversationStorageKey() {
    const e = this.currentUser?.providerUserId || this.currentUser?.id || "anonymous";
    return `universal-chat-widget:${this._config.channel || "DEFAULT"}:${e}`;
  }
  showError(e) {
    const t = this.getElement("error");
    t.textContent = e, t.classList.remove("hidden");
  }
  clearError() {
    const e = this.getElement("error");
    e.textContent = "", e.classList.add("hidden");
  }
  formatBytes(e) {
    if (e < 1024) return `${e} B`;
    const t = ["KB", "MB", "GB"];
    let s = e / 1024, n = 0;
    for (; s >= 1024 && n < t.length - 1; )
      s /= 1024, n++;
    return `${s.toFixed(s >= 10 ? 0 : 1)} ${t[n]}`;
  }
  formatTime(e) {
    return e.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
  }
  formatMessageTime(e) {
    const t = new Date(e);
    return Number.isNaN(t.getTime()) ? e : this.formatTime(t);
  }
  escapeHtml(e) {
    return e.replace(/[&<>'"]/g, (t) => ({
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      "'": "&#39;",
      '"': "&quot;"
    })[t] ?? t);
  }
  getElement(e) {
    const t = this.shadow.querySelector(`#${e}`);
    if (!t) throw new Error(`UniversalChatWidget element not found: #${e}`);
    return t;
  }
}
customElements.get("universal-chat-widget") || customElements.define("universal-chat-widget", f);
export {
  f as UniversalChatWidget
};
//# sourceMappingURL=universal-chat-widget.js.map
