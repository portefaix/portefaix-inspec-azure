# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

portefaix_version = input('portefaix_version')
portefaix_section = 'resource_group'

title "Resource Group standards"

# RG.1
# =======================================================

portefaix_req = "#{portefaix_section}.1"

control "portefaix-azure-#{portefaix_version}-#{portefaix_req}" do
  title "Ensure that resource groups have tags"
  impact 1.0

  tag standard: "portefaix"
  tag portefaix_version: "#{portefaix_version}"
  tag portefaix_section: "#{portefaix_section}"
  tag portefaix_req: "#{portefaix_req}"
  
  ref "Portefaix Azure #{portefaix_version}, #{portefaix_section}"

  describe azure_resource_groups do
    it { should exist }
    its('tags') { should include("service") }
    its('tags') { should include("made-by": 'terraform') }
  end

end
