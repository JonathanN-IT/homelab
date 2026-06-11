#!/bin/bash
# OSINT Stack — CT500 (cybersec) — Install Script
set -e

echo "=== Mise à jour du système ==="
apt update && apt upgrade -y

echo "=== Installation des dépendances ==="
apt install -y \
  curl wget git python3 python3-pip python3-venv \
  nmap whois dnsutils net-tools \
  jq build-essential libssl-dev libffi-dev \
  ca-certificates gnupg lsb-release

# ─── Docker ───────────────────────────────────────────────────────────────────
echo "=== Installation Docker ==="
if ! command -v docker &>/dev/null; then
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
fi

# ─── SpiderFoot (web UI OSINT) ────────────────────────────────────────────────
echo "=== SpiderFoot (interface web) ==="
mkdir -p /opt/spiderfoot
cat > /opt/spiderfoot/docker-compose.yml <<'EOF'
services:
  spiderfoot:
    image: smicallef/spiderfoot:latest
    container_name: spiderfoot
    ports:
      - "5001:5001"
    volumes:
      - spiderfoot_data:/home/spiderfoot/.spiderfoot
    restart: unless-stopped

volumes:
  spiderfoot_data:
EOF
docker compose -f /opt/spiderfoot/docker-compose.yml up -d

# ─── theHarvester ─────────────────────────────────────────────────────────────
echo "=== theHarvester ==="
cd /opt
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
python3 -m venv venv
source venv/bin/activate
pip install -r requirements/base.txt
deactivate
ln -sf /opt/theHarvester/venv/bin/python3 /opt/theHarvester/venv/bin/python 2>/dev/null || true
cat > /usr/local/bin/theharvester <<'SCRIPT'
#!/bin/bash
cd /opt/theHarvester && source venv/bin/activate && python3 theHarvester.py "$@"
SCRIPT
chmod +x /usr/local/bin/theharvester

# ─── Recon-ng ─────────────────────────────────────────────────────────────────
echo "=== Recon-ng ==="
cd /opt
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
python3 -m venv venv
source venv/bin/activate
pip install -r REQUIREMENTS
deactivate
cat > /usr/local/bin/recon-ng <<'SCRIPT'
#!/bin/bash
cd /opt/recon-ng && source venv/bin/activate && python3 recon-ng "$@"
SCRIPT
chmod +x /usr/local/bin/recon-ng

# ─── Maigret (username OSINT) ─────────────────────────────────────────────────
echo "=== Maigret ==="
cd /opt
git clone https://github.com/soxoj/maigret.git
cd maigret
python3 -m venv venv
source venv/bin/activate
pip install .
deactivate
cat > /usr/local/bin/maigret <<'SCRIPT'
#!/bin/bash
cd /opt/maigret && source venv/bin/activate && maigret "$@"
SCRIPT
chmod +x /usr/local/bin/maigret

# ─── Holehe (email OSINT) ─────────────────────────────────────────────────────
echo "=== Holehe ==="
pip3 install holehe --break-system-packages 2>/dev/null || \
  (cd /opt && python3 -m venv holehe_env && source holehe_env/bin/activate && pip install holehe && deactivate && \
  echo '#!/bin/bash\nsource /opt/holehe_env/bin/activate && holehe "$@"' > /usr/local/bin/holehe && chmod +x /usr/local/bin/holehe)

# ─── Amass (subdomain enumeration) ────────────────────────────────────────────
echo "=== Amass ==="
AMASS_VER=$(curl -s https://api.github.com/repos/owasp-amass/amass/releases/latest | jq -r .tag_name)
wget -q "https://github.com/owasp-amass/amass/releases/latest/download/amass_Linux_amd64.zip" -O /tmp/amass.zip
unzip -q /tmp/amass.zip -d /tmp/amass
mv /tmp/amass/amass*/amass /usr/local/bin/amass
chmod +x /usr/local/bin/amass
rm -rf /tmp/amass /tmp/amass.zip

# ─── Récapitulatif ────────────────────────────────────────────────────────────
echo ""
echo "=========================================="
echo " OSINT Stack installé sur CT500 (cybersec)"
echo "=========================================="
echo " SpiderFoot Web UI : http://192.168.0.20:5001"
echo " theHarvester CLI  : theharvester -d example.com -b all"
echo " Recon-ng CLI      : recon-ng"
echo " Maigret CLI       : maigret <username>"
echo " Holehe CLI        : holehe <email>"
echo " Amass CLI         : amass enum -d example.com"
echo "=========================================="
